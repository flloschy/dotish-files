def collect():
    moveFile(f"{REALPATH}katerc", f"{SAVEPATH}/kate/katerc")

def unpack():
    moveFile(f"{SAVEPATH}/kate/katerc", f"{REALPATH}katerc")