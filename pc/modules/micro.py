def collect():
    collectMoveFilesInclusive(["bindings.json", "settings.json"], "micro")

def unpack():
    unpackMoveFilesExclusive([], "micro")