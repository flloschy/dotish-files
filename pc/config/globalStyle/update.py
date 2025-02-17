import os, subprocess, colorgram, colorsys

def hex(color):
    rgb = colorsys.hls_to_rgb(color.h/180, color.l/255, color.s/255)
    return '#%02x%02x%02x' % (int(rgb[0]*255), int(rgb[1]*255), int(rgb[2]*255))

wallpaper = subprocess.check_output(["swww", "query"]).decode("UTF-8")
wallpaper = wallpaper.split("\n")[0].split(":")
wallpaper = wallpaper[4]
wallpaper = wallpaper.strip()


colors = colorgram.extract(wallpaper, 4)
colors.sort(key=lambda c: c.hsl.l)


colors[0] = colors[0].hsl._replace(l=25)
colors[1] = colors[1].hsl._replace(l=80)
colors[2] = colors[2].hsl._replace(l=130)
colors[3] = colors[3].hsl._replace(l=200)

colors[0] = hex(colors[0])
colors[1] = hex(colors[1])
colors[2] = hex(colors[2])
colors[3] = hex(colors[3])

names = [
    "background",
    "secondary",
    "primary",
    "text"
]

cssPallet = ""
hyprPallet = ""
alacrittyPallet = f"""[colors.primary]
background = '{colors[0]}'
foreground = '{colors[3]}'
[colors.cursor]
text = '{colors[3]}'
"""

for i, name in enumerate(names):
    cssPallet += f"@define-color {name} {colors[i]};\n"
    hyprPallet += f"${name} = rgb({colors[i].removeprefix("#")})\n"


with open("./colors.css", "w") as f:
    f.write(cssPallet)
with open("./hyprColors.conf", "w") as f:
    f.write(hyprPallet)
with open("./alacritty.toml", "w") as f:
    f.write(alacrittyPallet)
with open("/home/floschy/.config/tofi/config", "r") as r:
    lines = r.read().split("\n")
    with open("/home/floschy/.config/tofi/config", "w") as w:
        w.write("")
    with open("/home/floschy/.config/tofi/config", "a") as w:
        for line in lines:
            if not line.startswith("selection-color"):
                w.write(f"{line}\n")
            else:
                w.write(f"selection-color = {colors[3]}\n")


# updating
os.system("swaync-client -rs")
os.system("hyprctl reload")
os.system(f"cd /home/floschy/.config/vesktop/settings/ && tmp=$(mktemp) && cp ./settings.json $tmp && jq '.plugins.ClientTheme.color=\"{colors[0].removeprefix('#')}\"' $tmp > settings.json && rm $tmp")
os.system("notify-send \"Color theme updated\"")
print(colors)
