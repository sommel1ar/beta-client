import struct
from PIL import Image, ImageFont, ImageDraw

FONT = r"C:\modulo\minecraft\_launcher\native\fonts\SpaceGrotesk-Medium.ttf"
OUT_H = r"C:\modulo\minecraft\_launcher\native\jni\font_blob.h"
BAKE = 48
FIRST_CP = 32
COUNT = 224      # 32..255 = ASCII + Latin-1 Supplement (acentos PT/ES/FR/DE/IT)
ATLAS_W = 512
PAD = 2

font = ImageFont.truetype(FONT, BAKE)
ascent, descent = font.getmetrics()
line_height = float(ascent + descent)
baseline = BAKE
canvas = BAKE * 2

glyphs = []
for cp in range(FIRST_CP, FIRST_CP + COUNT):
    ch = chr(cp)
    adv = float(font.getlength(ch))
    img = Image.new("L", (canvas, canvas), 0)
    d = ImageDraw.Draw(img)
    pen = BAKE
    d.text((pen, baseline), ch, font=font, fill=255, anchor="ls")
    bbox = img.getbbox()
    if bbox is None:
        glyphs.append({"cov": None, "w": 0, "h": 0, "xoff": 0.0, "yoff": 0.0, "adv": adv})
        continue
    l, t, r, b = bbox
    glyphs.append({"cov": img.crop(bbox), "w": r - l, "h": b - t,
                   "xoff": float(l - pen), "yoff": float(t - baseline), "adv": adv})

x = PAD
y = PAD
row_h = 0
for g in glyphs:
    if g["cov"] is None:
        g["x"] = 0; g["y"] = 0
        continue
    if x + g["w"] + PAD > ATLAS_W:
        x = PAD
        y += row_h + PAD
        row_h = 0
    g["x"] = x
    g["y"] = y
    x += g["w"] + PAD
    if g["h"] > row_h:
        row_h = g["h"]
atlas_h = ((y + row_h + PAD + 3) // 4) * 4

atlas = Image.new("L", (ATLAS_W, atlas_h), 0)
for g in glyphs:
    if g["cov"] is not None:
        atlas.paste(g["cov"], (g["x"], g["y"]))

blob = bytearray()
blob += struct.pack("<4sHHffHH", b"VCF1", ATLAS_W, atlas_h, float(BAKE), line_height, FIRST_CP, COUNT)
for g in glyphs:
    blob += struct.pack("<HHHHfff", g["x"], g["y"], g["w"], g["h"], g["xoff"], g["yoff"], g["adv"])
blob += atlas.tobytes()

with open(OUT_H, "w") as f:
    f.write("static const unsigned char font_blob[] = {\n")
    for i in range(0, len(blob), 20):
        f.write("  " + ",".join(str(x) for x in blob[i:i+20]) + ",\n")
    f.write("};\n")
    f.write("static const unsigned int font_blob_len = %d;\n" % len(blob))

print("atlas %dx%d, %d glifos, blob %d bytes, ascent=%d descent=%d line=%.1f" %
      (ATLAS_W, atlas_h, COUNT, len(blob), ascent, descent, line_height))
