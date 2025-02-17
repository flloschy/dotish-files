def collect():
    includeFiles = ["config.json", "menus.json"]
    collectMoveFilesInclusive(includeFiles, "kando")

def unpack():
    unpackMoveFilesExclusive([], "kando")
