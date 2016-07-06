#!/bin/bash
echo "Speak in English"
rec -c 1 -r 16000 -b 16 Audio_English/original/t3.wav > Log/rec.txt
echo "Audio recorded"
echo "Amplifying audio . . . "
sox -v 256.0 Audio_English/original/t3.wav Audio_English/amplified/t3.wav > Log/amplify.txt
echo "Taking sample noise from first 0.5 seconds . . ."
sox Audio_English/amplified/t3.wav Audio_English/noise/t3.wav trim 0 0.5 > Log/noise.txt
echo "Creating noise profile . . . "
sox Audio_English/noise/t3.wav -n noiseprof Audio_English/noiseProf/t3.prof > Log/noiseProf.txt
echo "Removing noise . . . "
sox Audio_English/amplified/t3.wav Audio_English/cleaned/t3.wav noisered Audio_English/noiseProf/t3.prof 0.21 > Log/noiseRemoval.txt
echo "Audio cleared"
echo "Converting speech to text . . . "
java -jar TejeshASR.jar > Text_English/t3.txt
echo "Converted to text in English"
echo "Translating text to Hindi"
~/mosesdecoder-RELEASE-3.0/bin/moses -f ~/working_coep/train/model/moses.ini < Text_English/t3.txt > Text_Hindi/t3.txt
echo "Text Translated to Hindi"
echo "Converting Hindi text to audio . . ."
text2wave -o Audio_Hindi/t3.wav -eval '(voice_hindi_NSK_diphone)' Text_Hindi/t3.txt
echo "Converted to Hindi audio"
play Audio_Hindi/t3.wav