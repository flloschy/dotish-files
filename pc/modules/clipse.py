def collect():
    includeFiles = ["config.json", "custom_theme.json"]
    collectMoveFilesInclusive(includeFiles, "clipse")

def unpack():
    unpackMoveFilesExclusive([], "clipse")