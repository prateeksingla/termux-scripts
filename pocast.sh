#!/bin/bash

# Get the current date and week number
current_date=$(date +'%Y-%m-%d')
current_week=$(date +'%U')

# Construct the URL based on the date and week number
url="https://iocl.com/uploads/podcasts/Hi_Octane_Ep_$((63 + current_week)).mp3"

# Specify the output file name (you can customize this)
output_file="/sdcard/Music/Podcast/Hi_Octane_Ep_$((63 + current_week)).mp3"

# Use wget to download the file
if wget -q --spider "$url"; then
    wget "$url" -O "$output_file"
else
    # If wget receives a 404 response, display an error message
    echo "File not found: $url"
fi