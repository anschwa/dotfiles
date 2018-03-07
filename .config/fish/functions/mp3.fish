function mp3
    # Get the best audio, convert it to MP3, and save it to the current
    # directory.
    youtube-dl --default-search=ytsearch: \
               --restrict-filenames \
               --format=bestaudio \
               --extract-audio \
               --audio-format=mp3 \
               --audio-quality=1 "$argv"
end
