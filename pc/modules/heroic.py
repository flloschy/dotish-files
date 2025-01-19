def collect():
    includeFiles = ["config.json", "Preferences"]
    collectMoveFilesInclusive(includeFiles, "heroic")

def unpack():
    unpackMoveFilesExclusive([], "heroic")