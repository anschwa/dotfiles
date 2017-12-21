function play
    # Skip DASH manifest for speed purposes. This might actually disable
    # being able to specify things like 'bestaudio' as the requested format,
    # but try anyway.
    # Get the best audio that isn't WebM, because afplay doesn't support it.
    # Use "$*" so that quoting the requested song isn't necessary.
    youtube-dl --default-search=ytsearch: \
               --youtube-skip-dash-manifest \
               --output="/tmp/%(title)s-%(id)s.%(ext)s" \
               --restrict-filenames \
               --format="bestaudio[ext!=webm]" \
               --exec=afplay $argv
end
