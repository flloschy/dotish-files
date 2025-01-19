import os
NAME = os.getlogin()
REALPATH = f"/home/{NAME}/.config/"
SAVEPATH = "./config/"
DRY = False

def moveFile(a:str, b:str):
    parent = b.split("/")
    parent.pop()
    b = "/".join(parent)
    command = f"mkdir -p {b} && cp -R {a} {b}" 
    print(f"{command=}")
    if not DRY:
        os.system(command)

def collectMoveFilesInclusive(
    inclusiveFiles: list[str],
    configFolder: str,
):
    for file in inclusiveFiles:
        origin = f"{REALPATH}{configFolder}/{file}"
        destination = f"{SAVEPATH}{configFolder}/{file}"
        moveFile(origin, destination)

def collectMoveFilesExclusive(
    excludeFiles: list[str],
    configFolder: str
):
    files = os.listdir(f"{REALPATH}{configFolder}")
    files = filter(lambda file: file not in excludeFiles, files)
    collectMoveFilesInclusive(files, configFolder)

def unpackMoveFilesInclusive(
    inclusiveFiles: list[str],
    configFolder: str,
):
    for file in inclusiveFiles:
        origin = f"{SAVEPATH}{configFolder}/{file}" 
        destination = f"{REALPATH}{configFolder}/{file}"
        moveFile(origin, destination)

def unpackMoveFilesExclusive(
    excludeFiles: list[str],
    configFolder: str
):
    files = os.listdir(f"{REALPATH}{configFolder}")
    files = filter(lambda file: file not in excludeFiles, files)
    unpackMoveFilesInclusive(files, configFolder)