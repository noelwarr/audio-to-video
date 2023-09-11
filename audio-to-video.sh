ffmpeg -y \
    -framerate 25 \
    -loop 1 \
    -i logo.png \
    -i "$1" \
    -filter_complex "[1:a]showwaves=s=440x360:mode=p2p[v]; \
                     [0:v][v]overlay=740:180,format=yuv420p[out]" \
    -map "[out]" \
    -map 1:a \
    -c:v libx264 \
    -preset medium \
    -tune stillimage \
    -crf 18 \
    -c:a aac \
    -b:a 192k \
    -shortest \
    "$2"
