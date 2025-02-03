def collect():
    moveFile(f"{REALPATH}/VSCodium/User/settings.json", f"{SAVEPATH}/VSCodium/settings.json")
    moveFile(f"{REALPATH}/VSCodium/User/keybindings.json", f"{SAVEPATH}/VSCodium/keybindings.json")

def unpack():
    moveFile(f"{SAVEPATH}/VSCodium/settings.json", f"{REALPATH}/VSCodium/User/settings.json")
    moveFile(f"{SAVEPATH}/VSCodium/keybindings.json", f"{REALPATH}/VSCodium/User/keybindings.json")
