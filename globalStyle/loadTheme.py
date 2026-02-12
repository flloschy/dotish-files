import subprocess
import json
import os
import time


raw = subprocess.check_output(["swww", "query"])
wallpaper = raw.decode("UTF-8").splitlines()[0].split("image: ")[1]

store = wallpaper \
        .removesuffix(".png") \
        .removesuffix(".jpg") \
        .removesuffix(".jpeg")
if not os.path.exists(store):
    from genMissing import gen
    gen(wallpaper)

background = ""
primary = ""
secondary = ""
text = ""
with open(store, "r") as file:
    colors = file.read().splitlines()
    background = colors[0]
    primary = colors[1]
    secondary = colors[2]
    text = colors[3]

with open("./alacritty.toml", "w") as file:
    file.write(f"""
[colors.primary]
background = '#{background}'
foreground = '#{text}'
[colors.cursor]
text = '#{text}'
""")

with open("./colors.css", "w") as file:
    file.write(f"""
@define-color background #{background};
@define-color secondary #{secondary};
@define-color primary #{primary};
@define-color text #{text};
""")

with open("./hyprColors.conf", "w") as file:
    file.write(f"""
$background = rgb({background})
$secondary = rgb({secondary})
$primary = rgb({primary})
$text = rgb({text})
""")

with open("/home/floschy/.config/gtk-4.0/colors.css", "w") as file:
    file.write(f"""@define-color theme_selected_bg_color #{primary};""")
with open("/home/floschy/.config/gtk-3.0/colors.css", "w") as file:
    file.write(f"""@define-color theme_selected_bg_color #{primary};""")

with open("/home/floschy/.config/tofi/config", "r") as r:
    lines = r.read().split("\n")
    with open("/home/floschy/.config/tofi/config", "w") as w:
        w.write("")
    with open("/home/floschy/.config/tofi/config", "a") as w:
        for line in lines:
            if not line.startswith("selection-color"):
                w.write(f"{line}\n")
            else:
                w.write(f"selection-color = #{primary}\n")

with open("/home/floschy/.config/vesktop/settings/settings.json", "r") as read:
    config = json.load(read)
    config["plugins"]["ClientTheme"]["color"] = background
    with open("/home/floschy/.config/vesktop/settings/settings.json", "w") as write:
        json.dump(config, write)


# reload
os.system("swaync-client -rs")
os.system("hyprctl reload")
os.system(f"razer-cli -e static -b 100 -c {primary}")
time.sleep(2)
os.system("eval \"$(notify-send --wait -a \"Color theme\" -t 5000 -A \"killall electron && sleep 3 && setsid nohup vesktop </dev/null >/dev/null 2>&1 &\"=\"Restart Vesktop\" \"Color theme\" \"updated!\")\"")
