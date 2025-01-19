FROM jellyfin/jellyfin:latest
RUN apt update
RUN apt install -y python3-pip
RUN apt install -y id3v2
RUN python3 -m pip install --break-system-packages -U yt-dlp