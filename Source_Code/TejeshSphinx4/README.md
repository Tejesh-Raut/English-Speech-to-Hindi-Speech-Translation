# Speech-Recognition
__Steps to record audio :__
* ___rec -c 1 -r 16000 -b 16 original/t2.wav___
	* This command records audio until ctrl+C is pressed.
	* -c defines that sound is recorded in a single channel, -r defines 16000 sample-rate and -b defines 16-bit sample encoding.
* ___sox -v 256.0 original/t2.wav amplified/t2.wav___
	* It increases the volume by 256
* ___play amplified/t2.wav___
	* To listen to the recording.
* ___soxi amplified/t2.wav___
	* To get statistics of an audio file
* ___sox amplified/t2.wav noise/t2.wav trim 0 0.5___
	* Audio of length 0.5 seconds starting from 0th second is trimmed and stored to a new file noise.wav
* ___sox noise/t2.wav -n noiseprof noiseProf/t2.prof___
	* Create a noise profile from noise.wav
* ___sox amplified/t2.wav cleaned/t2.wav noisered noiseProf/t2.prof 0.21___
	* Remove noise from the file tejeshv256.wav using the noise profile and store the clean audio in the file output.wav
* ___play cleaned/t2.wav___
	* To listen the recording after removing noise.