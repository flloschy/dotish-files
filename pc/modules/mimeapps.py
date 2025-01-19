def collect():
    moveFile(f"{REALPATH}mimeapps.list", f"{SAVEPATH}/mimeapps/mimeapps.list")

def unpack():
    moveFile(f"{SAVEPATH}/mimeapps/mimeapps.list", f"{REALPATH}mimeapps.list")