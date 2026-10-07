import struct, math
from PIL import Image, ImageDraw

# Gera um atlas de ICONES (1 canal alpha) desenhados vetorialmente, com supersampling (SS=4) p/ anti-alias.
# Saida: native/jni/icons_blob.h (formato VCI1) + preview PNG.
SS = 4
CELL = 64          # tamanho final de cada icone (px)
C = CELL * SS      # canvas supersampled
OUT_H = r"C:\modulo\minecraft\_launcher\native\jni\icons_blob.h"
PREVIEW = r"C:\Users\moniq\AppData\Local\Temp\claude\C--modulo\3bf949d6-e818-44a0-813b-1dcf4f14c5bf\scratchpad\icons_preview.png"

def new_cell():
    img = Image.new("L", (C, C), 0)
    return img, ImageDraw.Draw(img)

def gear(d):
    cx = cy = C/2
    R = C*0.46          # ponta do dente
    Rin = C*0.34        # vale entre dentes
    Rbody = C*0.37      # corpo
    teeth = 8
    tw = 0.30           # largura angular do dente (fracao do passo)
    pts = []
    for i in range(teeth):
        a = i/teeth*2*math.pi
        step = 2*math.pi/teeth
        for (ang, rad) in [(a-tw*step, Rin),(a-tw*step*0.6, R),(a+tw*step*0.6, R),(a+tw*step, Rin)]:
            pts.append((cx+math.cos(ang)*rad, cy+math.sin(ang)*rad))
    d.polygon(pts, fill=255)
    d.ellipse([cx-Rbody, cy-Rbody, cx+Rbody, cy+Rbody], fill=255)
    hole = C*0.15
    d.ellipse([cx-hole, cy-hole, cx+hole, cy+hole], fill=0)

def globe(d):
    cx = cy = C/2
    R = C*0.44
    lw = int(C*0.055)
    d.ellipse([cx-R, cy-R, cx+R, cy+R], outline=255, width=lw)
    # meridiano vertical + 1 elipse fina
    d.ellipse([cx-R*0.42, cy-R, cx+R*0.42, cy+R], outline=255, width=lw)
    # equador
    d.line([cx-R, cy, cx+R, cy], fill=255, width=lw)
    # dois paralelos (arcos)
    d.arc([cx-R, cy-R, cx+R, cy+R*3.0], 200, 340, fill=255, width=lw)  # inferior
    d.arc([cx-R, cy-R*3.0, cx+R, cy+R], 20, 160, fill=255, width=lw)   # superior

def door(d):
    # icone de sair: moldura "[" (porta) + seta saindo pra direita
    cy = C/2
    lw = int(C*0.06)
    lx = C*0.22
    ty, by = C*0.18, C*0.82
    d.line([C*0.46, ty, lx, ty, lx, by, C*0.46, by], fill=255, width=lw, joint="curve")
    ay = cy
    ax0, ax1 = C*0.40, C*0.82
    d.line([ax0, ay, ax1, ay], fill=255, width=lw)
    hs = C*0.12
    d.line([ax1, ay, ax1-hs, ay-hs], fill=255, width=lw, joint="curve")
    d.line([ax1, ay, ax1-hs, ay+hs], fill=255, width=lw, joint="curve")

ICONS = [("gear", gear), ("globe", globe), ("door", door)]

cells = []
for name, fn in ICONS:
    img, d = new_cell()
    fn(d)
    cells.append(img.resize((CELL, CELL), Image.LANCZOS))

# atlas horizontal
AW = CELL * len(cells)
AH = CELL
atlas = Image.new("L", (AW, AH), 0)
meta = []
for i, c in enumerate(cells):
    atlas.paste(c, (i*CELL, 0))
    meta.append((i*CELL, 0, CELL, CELL))

# preview (invertido claro p/ ver no fundo branco)
atlas.save(PREVIEW)
print("preview:", PREVIEW, "atlas", AW, "x", AH, "icones", len(cells))

# blob VCI1: <4s H H H>(magic, AW, AH, N) + N*<HHHH>(x,y,w,h) + atlas
blob = bytearray()
blob += struct.pack("<4sHHH", b"VCI1", AW, AH, len(cells))
for (x,y,w,h) in meta:
    blob += struct.pack("<HHHH", x,y,w,h)
blob += atlas.tobytes()
with open(OUT_H, "w") as f:
    f.write("static const unsigned char icons_blob[] = {\n")
    for i in range(0, len(blob), 20):
        f.write("  " + ",".join(str(b) for b in blob[i:i+20]) + ",\n")
    f.write("};\n")
    f.write("static const unsigned int icons_blob_len = %d;\n" % len(blob))
print("blob", len(blob), "bytes ->", OUT_H)
