#!/bin/bash

# Check if a username is provided as an argument, or prompt the user to enter it
if [ -z "$1" ]; then
    read -p "Enter YouTube username: " USER
else
    USER="$1"
fi

# Replace OUTPUT_FILE with the path of the TSV file you want to write the index to
OUTPUT_FILE=/path/to/output.tsv

# Download the HTML content of the user's page
HTML=$(curl -s "https://www.youtube.com/user/${USER}/videos")

# Extract the information for each video using regular expressions
echo -e "# Time and date posted\tAbsolute URL\tTitle\tAuthor's description\tVideo ID" > $OUTPUT_FILE
echo "$HTML" | grep -o '<a href="/watch[^"]*"' | while read -r LINK; do
    URL="https://www.youtube.com${LINK:9}"
    VIDEO_ID=$(echo "$URL" | grep -o 'v=[^&]*' | sed 's/v=//')
    TITLE=$(echo "$HTML" | grep -o "aria-label=\"[^\"]*\" href=\"$LINK\"" | sed 's/aria-label="//' | sed 's/" href=.*//')
    DESCRIPTION=$(echo "$HTML" | grep -o "<yt-formatted-string class=\"style-scope ytd-video-renderer\" [^>]*>[^<]*</yt-formatted-string>" | sed 's/<[^>]*>//g' | sed 's/^ *//g' | sed 's/ *$//g' | head -n 1)
    DATE=$(echo "$HTML" | grep -o "<div class=\"style-scope ytd-grid-video-renderer\">[^<]*</div>" | sed 's/<[^>]*>//g' | sed 's/^ *//g' | sed 's/ *$//g' | head -n 1)
    echo -e "${DATE}\t${URL}\t${TITLE}\t${DESCRIPTION}\t${VIDEO_ID}" >> $OUTPUT_FILE
done
