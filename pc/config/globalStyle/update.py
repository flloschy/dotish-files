import os, subprocess



wallpaper = subprocess.check_output(["swww", "query"]).decode("UTF-8")
wallpaper = wallpaper.split("\n")[0].split(":")
wallpaper = wallpaper[4]
wallpaper = wallpaper.strip()


colors = subprocess.check_output(["magick", wallpaper, "+dither", "-colors", "4", "-unique-colors", "txt:"]).decode("UTF-8")
colors = colors.split("\n")
colors = filter(lambda line: not line.startswith("#") and "#" in line, colors)
colors = list(colors)
colors = map(lambda line: list(filter(lambda element: element.startswith("#"), line.split(" "))), colors)
colors = list(colors)

names = [
    "background",
    "secondary",
    "primary",
    "text"
]

cssPallet = ""
hyprPallet = ""
alacrittyPallet = f"""[colors.primary]
background = '{colors[0][0][0:7]}'
foreground = '{colors[2][0][0:7]}'
[colors.cursor]
text = '{colors[3][0][0:7]}'
"""

for i, name in enumerate(names):
    cssPallet += f"@define-color {name} {colors[i][0].removesuffix('FF')};\n"
    hyprPallet += f"${name} = rgb({colors[i][0].removeprefix("#")[0:6]})\n"


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
                w.write(f"selection-color = {colors[3][0]}\n")


# updating
os.system("swaync-client -rs")
os.system("hyprctl reload")
os.system(f"cd /home/floschy/.config/vesktop/settings/ && tmp=$(mktemp) && cp ./settings.json $tmp && jq '.plugins.ClientTheme.color=\"{colors[0][0][1:7]}\"' $tmp > settings.json && rm $tmp")
os.system("notify-send \"Color theme updated\"")
