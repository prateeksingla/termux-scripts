termux-wake-lock
cd /sdcard/Music/Youtube
youtube-dl -x --audio-format mp3 $(termux-clipboard-get)
termux-wake-unlock