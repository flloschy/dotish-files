def collect():
    moveFile(f"/home/{NAME}/.zshrc", f"{SAVEPATH}zsh/.zshrc")
    moveFile(f"/home/{NAME}/.oh-my-zsh/custom/themes", f"{SAVEPATH}zsh/themes")

def unpack():
    moveFile(f"{SAVEPATH}zsh/.zshrc", f"/home/{NAME}/.zshrc")