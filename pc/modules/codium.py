def collect():
    collectMoveFilesInclusive(["keybindings.json", "settings.json"], "VSCodium/User")

def unpack():
    unpackMoveFilesExclusive([], "VSCodium/User")