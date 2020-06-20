INPUT_IMAGE=$1
FILE_NAME=$(basename -- "$INPUT_IMAGE"| cut -f 1 -d '.')
OUTPUT_IMAGE="${FILE_NAME}_instagramized.png"

ASPECT_RATIO=1

ffmpeg -i $INPUT_IMAGE \
       -filter_complex_script squareblured.filter\
       -aspect $ASPECT_RATIO\
       -y \
       $OUTPUT_IMAGE

open $OUTPUT_IMAGE