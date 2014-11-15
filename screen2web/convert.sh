#!/bin/bash
if [ -z "$1" ]; then
    echo 'usage: docker run -it --rm -v `pwd`:/target parente/screen2web some_video.mov'
    exit 1
fi

ffmpeg -i /target/$1 -profile main -acodec copy -vcodec libx264 /target/main_$1
ffmpeg2theora --videoquality 5 --audioquality 1 /target/main_$1 -o /target/main_$1.ogv