def collect():
    collectMoveFilesInclusive(["bindings.json", "settings.json", "colorschemes/"], "micro")

def unpack():
    unpackMoveFilesExclusive([], "micro")
