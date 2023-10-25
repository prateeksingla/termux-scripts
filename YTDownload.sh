termux-wake-lock
cd /sdcard/Movies/Youtube
youtube-dl --write-srt --sub-lang en $(termux-clipboard-get)
termux-wake-unlock