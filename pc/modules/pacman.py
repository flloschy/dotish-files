
def collect():
    os.system("yay -Qqe > /tmp/installedPackages")
    moveFile(f"/tmp/installedPackages", f"{SAVEPATH}pacman/installedPackages")

def unpack():
    with open(f"/tmp/installedPackages", "r") as f:
        packages = f.readlines()
        command = f"yay -S --noconfirm {' '.join(packages)}"
        # print(f"{command=}")
        if not DRY:
            os.system(command)