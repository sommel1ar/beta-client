import struct, math
from PIL import Image, ImageDraw, ImageFont

# Atlas de ICONES (1 canal alpha). A maioria e desenhada vetorialmente (supersampling SS=4);
# APENAS CPS e Auto Sprint usam glifos da FontAwesome (hand-pointer / person-running), a pedido.
# Saida: native/jni/icons_blob.h (formato VCI1) + preview PNG.
SS = 4
CELL = 64
C = CELL * SS
OUT_H = r"C:\modulo\minecraft\_launcher\native\jni\icons_blob.h"
PREVIEW = r"C:\Users\moniq\AppData\Local\Temp\claude\C--modulo\3bf949d6-e818-44a0-813b-1dcf4f14c5bf\scratchpad\icons_preview.png"
FA_PATH = r"C:\modulo\minecraft\_launcher\native\fonts\fa-solid-900.ttf"

FA = ImageFont.truetype(FA_PATH, int(C * 0.60))

def new_cell():
    img = Image.new("L", (C, C), 0)
    return img, ImageDraw.Draw(img)

def glyph(d, cp):            # glifo da FontAwesome, centralizado (so CPS e Sprint usam)
    ch = chr(cp)
    bbox = d.textbbox((0, 0), ch, font=FA)
    w, h = bbox[2] - bbox[0], bbox[3] - bbox[1]
    d.text(((C - w) / 2 - bbox[0], (C - h) / 2 - bbox[1]), ch, font=FA, fill=255)

def gear(d):
    cx = cy = C/2
    R = C*0.46; Rin = C*0.34; Rbody = C*0.37; teeth = 8; tw = 0.30
    pts = []
    for i in range(teeth):
        a = i/teeth*2*math.pi; step = 2*math.pi/teeth
        for (ang, rad) in [(a-tw*step, Rin),(a-tw*step*0.6, R),(a+tw*step*0.6, R),(a+tw*step, Rin)]:
            pts.append((cx+math.cos(ang)*rad, cy+math.sin(ang)*rad))
    d.polygon(pts, fill=255)
    d.ellipse([cx-Rbody, cy-Rbody, cx+Rbody, cy+Rbody], fill=255)
    hole = C*0.15
    d.ellipse([cx-hole, cy-hole, cx+hole, cy+hole], fill=0)

def globe(d):
    cx = cy = C/2; R = C*0.44; lw = int(C*0.055)
    d.ellipse([cx-R, cy-R, cx+R, cy+R], outline=255, width=lw)
    d.ellipse([cx-R*0.42, cy-R, cx+R*0.42, cy+R], outline=255, width=lw)
    d.line([cx-R, cy, cx+R, cy], fill=255, width=lw)
    d.arc([cx-R, cy-R, cx+R, cy+R*3.0], 200, 340, fill=255, width=lw)
    d.arc([cx-R, cy-R*3.0, cx+R, cy+R], 20, 160, fill=255, width=lw)

def door(d):
    cy = C/2; lw = int(C*0.06); lx = C*0.22; ty, by = C*0.18, C*0.82
    d.line([C*0.46, ty, lx, ty, lx, by, C*0.46, by], fill=255, width=lw, joint="curve")
    ay = cy; ax0, ax1 = C*0.40, C*0.82
    d.line([ax0, ay, ax1, ay], fill=255, width=lw)
    hs = C*0.12
    d.line([ax1, ay, ax1-hs, ay-hs], fill=255, width=lw, joint="curve")
    d.line([ax1, ay, ax1-hs, ay+hs], fill=255, width=lw, joint="curve")

def disc(d):
    pad = C*0.05
    d.ellipse([pad, pad, C-pad, C-pad], fill=255)

def mag(d):
    cx, cy, R = C*0.42, C*0.42, C*0.25
    d.ellipse([cx-R, cy-R, cx+R, cy+R], outline=255, width=int(C*0.08))
    hx, hy = cx+R*0.72, cy+R*0.72
    d.line([hx, hy, C*0.83, C*0.83], fill=255, width=int(C*0.11))

def gauge(d):
    cx, cy, R = C*0.5, C*0.58, C*0.36
    d.arc([cx-R, cy-R, cx+R, cy+R], 165, 375, fill=255, width=int(C*0.075))
    a = math.radians(312)
    d.line([cx, cy, cx+math.cos(a)*R*0.82, cy+math.sin(a)*R*0.82], fill=255, width=int(C*0.065))
    d.ellipse([cx-C*0.06, cy-C*0.06, cx+C*0.06, cy+C*0.06], fill=255)

def bullseye(d):
    cx = cy = C/2
    for R in [C*0.42, C*0.27]:
        d.ellipse([cx-R, cy-R, cx+R, cy+R], outline=255, width=int(C*0.07))
    d.ellipse([cx-C*0.1, cy-C*0.1, cx+C*0.1, cy+C*0.1], fill=255)

def sun(d):
    cx = cy = C/2; R = C*0.19
    d.ellipse([cx-R, cy-R, cx+R, cy+R], fill=255)
    for i in range(8):
        a = i/8*2*math.pi
        d.line([cx+math.cos(a)*R*1.45, cy+math.sin(a)*R*1.45,
                cx+math.cos(a)*R*2.05, cy+math.sin(a)*R*2.05], fill=255, width=int(C*0.06))

def motion(d):
    lw = int(C*0.095)
    for y, L in [(C*0.30, 0.55), (C*0.50, 0.80), (C*0.70, 0.45)]:
        x1 = C*0.82
        d.line([x1 - C*L, y, x1, y], fill=255, width=lw)

def monitor(d):
    w, h = C*0.76, C*0.56
    x0, y0 = (C-w)/2, C*0.13
    d.rounded_rectangle([x0, y0, x0+w, y0+h], radius=C*0.06, outline=255, width=int(C*0.08))
    d.line([C*0.5, y0+h, C*0.5, y0+h+C*0.14], fill=255, width=int(C*0.08))
    d.line([C*0.32, y0+h+C*0.14, C*0.68, y0+h+C*0.14], fill=255, width=int(C*0.09))

def chevdown(d):
    lw = int(C*0.085)
    d.line([C*0.33, C*0.42, C*0.5, C*0.60, C*0.67, C*0.42], fill=255, width=lw, joint="curve")

def chevright(d):
    lw = int(C*0.085)
    d.line([C*0.42, C*0.33, C*0.60, C*0.5, C*0.42, C*0.67], fill=255, width=lw, joint="curve")

# indice -> (nome, desenho). int = glifo FontAwesome ; funcao = vetorial.
ICONS = [
    ("gear", gear), ("globe", globe), ("door", door), ("disc", disc),
    ("mag", mag), ("gauge", gauge), ("hand", 0xF25A), ("bullseye", bullseye),
    ("sun", sun), ("motion", motion), ("running", 0xF70C), ("monitor", monitor),
    ("chevdown", chevdown), ("chevright", chevright),
]

cells = []
for name, x in ICONS:
    img, d = new_cell()
    if isinstance(x, int): glyph(d, x)
    else: x(d)
    cells.append(img.resize((CELL, CELL), Image.LANCZOS))

AW = CELL * len(cells); AH = CELL
atlas = Image.new("L", (AW, AH), 0)
meta = []
for i, c in enumerate(cells):
    atlas.paste(c, (i*CELL, 0))
    meta.append((i*CELL, 0, CELL, CELL))

atlas.save(PREVIEW)
print("preview:", PREVIEW, "atlas", AW, "x", AH, "icones", len(cells))

blob = bytearray()
blob += struct.pack("<4sHHH", b"VCI1", AW, AH, len(cells))
for (x, y, w, h) in meta:
    blob += struct.pack("<HHHH", x, y, w, h)
blob += atlas.tobytes()
with open(OUT_H, "w") as f:
    f.write("static const unsigned char icons_blob[] = {\n")
    for i in range(0, len(blob), 20):
        f.write("  " + ",".join(str(b) for b in blob[i:i+20]) + ",\n")
    f.write("};\n")
    f.write("static const unsigned int icons_blob_len = %d;\n" % len(blob))
print("blob", len(blob), "bytes ->", OUT_H)
