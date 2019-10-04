#!/bin/bash

# Convert a .MOV to an animated .GIF using FFMPEG and Gifsicle.
# Credit: https://gist.github.com/dergachev/4627207
#
# Dependencies:
# ffmpeg
# gifsicle
#
# Example:
#
# $ ./gif.sh -i screencast.mov -o output.gif
#

inputFile="screen.mov" # input filename
outputFile="out.gif" # output filename
frameRate=10 # frames per second
optimize=3 # file size optimization. 3 being the highest
delay=3 # time between each gif in milliseconds. 3 = 30ms

while getopts "i:o:f:op:d:" opt; do
  case $opt in
  i)  inputFile="$OPTARG";;
  o)  outputFile="$OPTARG";;
  f)  frameRate="$OPTARG";;
  op) optimize="$OPTARG";;
  d)  delay="$OPTARG";;
  esac
done

shift $((OPTIND - 1))

printf "Input: $inputFile\n"
printf "Output: $outputFile\n\n"

CMD="ffmpeg -i $inputFile -s 1600x850 -r $frameRate -f gif - | gifsicle --optimize=$optimize --delay=$delay > $outputFile"

printf "Executing command:\n"
printf "$CMD\n\n"

eval $CMD
