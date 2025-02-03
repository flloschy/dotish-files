def collect():
    moveFile(f"/home/{NAME}/custominstall/dockerstuff/pihole/docker-compose.yml", f"{SAVEPATH}pihole/docker-compose.yml")

def unpack():
    moveFile(f"{SAVEPATH}pihole/docker-compose.yml", f"/home/{NAME}/custominstall/dockerstuff/pihole/docker-compose.yml")
