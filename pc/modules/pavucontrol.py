def collect():
    moveFile(f"{REALPATH}pavucontrol.ini", f"{SAVEPATH}pavucontrol/pavucontrol.ini")

def unpack():
    moveFile(f"{SAVEPATH}pavucontrol/pavucontrol.ini", f"{REALPATH}pavucontrol.ini")