INPUT_IMAGE=$1
FILE_NAME=$(basename -- "$INPUT_IMAGE"| cut -f 1 -d '.')
OUTPUT_IMAGE="${FILE_NAME}_instagramized.png"

OUTPUT_VIDEO="${FILE_NAME}_instagramized.mp4"
FPS=30 
VIDEO_CODEC=libx264
ASPECT_RATIO=1

sh ./squareblured.sh $INPUT_IMAGE

# https://ffmpeg.org/ffmpeg-filters.html#zoompan
ffmpeg -r $FPS \
       -i $OUTPUT_IMAGE \
       -filter_complex_script zoompan.filter\
       -aspect $ASPECT_RATIO\
       -c:v $VIDEO_CODEC \
       -shortest \
       -y \
       $OUTPUT_VIDEO

open $OUTPUT_VIDEO