import importlib.util
import sys
import os
from utility import DRY, collectMoveFilesExclusive, collectMoveFilesInclusive, NAME, REALPATH, SAVEPATH, unpackMoveFilesExclusive, unpackMoveFilesInclusive, moveFile

collecting = input("Do you want to collect or extract? (collect=Y extract=n)")
collecting = True if collecting == "" else (True if collecting == "y" or collecting == "Y" else False)
print(f"{collecting=}")

for module in os.listdir("./modules"):
    if module == "__pycache__": continue
    if collecting:
        print(f" -- Collecting {module} --")
    else:
        print(f" -- Extracting {module} --")
    with open(f"./modules/{module}", 'r') as f:
        content = f.read()
        if collecting:
            exec(content + "\n\ncollect()")
        else:
            exec(content + "\n\nunpack()")
