from Pylette import extract_colors
import colorsys
import os

def prep(color, l, s_overwrite=None):
    l /= 100
    h, _, s = color.hls
    if (s_overwrite): s = s_overwrite/100
    r, g, b = colorsys.hls_to_rgb(h, l, s)
    r, g, b = int(r*255), int(g*255), int(b*255)
    return '%02x%02x%02x' % (r, g, b)

def gen(image):
    store = image \
            .removesuffix(".png") \
            .removesuffix(".jpg") \
            .removesuffix(".jpeg")
    if (image == store): return
    if (os.path.exists(store)): return

    palette = extract_colors(image, palette_size=4)

    colors = [
        prep(palette.colors[0], 10),  # background
        prep(palette.colors[1], 50, 50),  # primary
        prep(palette.colors[2], 50, 30), # secondary
        prep(palette.colors[3], 90, 100)  # text
    ]

    with open(store, "w") as f:
        f.write("\n".join(colors))


if __name__ == '__main__':
    for wallpaper in os.listdir("./wallpaper"):
        gen(f"./wallpaper/{wallpaper}")
    import loadTheme
