# English-Speech-to-Hindi-Speech-Translation

## Overview:

This is an offline application by which user can translate voice from English to Hindi. This project is done using basically three parts. Speech from English is converted to text using a java project made using [Sphinx4](http://cmusphinx.sourceforge.net/wiki/sphinx4:webhome) java libraries. Then the text from English is converted to text in Hindi using [Moses](http://www.statmt.org/moses/). And finally the text from Hindi is read out i.e., converted from Hindi text to speech using [Festival](http://www.festvox.org/festival/). This is just a broad overview of working of the application. Many other softwares are used which will be referred later.

## Goals:

* Speech to speech translation between any two languages without using any online API.
* A continuous running application with good interface so that people with different languages can talk with each other freely.

## User's Manual:

Before starting this application you need to set up the environment in your PC. Details of setting up the environment is given in the next section.

Once you have setup everything, you need to go to this directory using terminal and run the run.sh file.

`./run.sh`

Start speaking after 0.5 seconds and when recording is over press ctrl + C to stop. The recording of the first 0.5 seconds will be considered and will be used to create the noise profile which will be further used for getting a clean audio.

After few seconds you will hear back the speech in Hindi.

You can see the text it has interpreted in English by opening the file Text_English/t3.txt and its translation done to Hindi by opening the file Text_Hindi/t3.txt.

## Setting up the environment:

For running this application you will first need to install some softwares and configure your PC to run it. Follow the given steps and proceed only if there are no errors. While following this tutorial you will also understand each software used in detail and the way they are used which might be useful for other projects.

### Recording noise free audio or remove noise from a recorded audio file

When you record an audio it is usually very unclear and full of background in Ubuntu.

Following steps will help you remove the noise from audio to a great extent:

* First of all you will need to install [SOX](http://packages.ubuntu.com/trusty/sox) package. To install "sox" open the terminal
and run the following command:

  `sudo apt-get install sox`

* Record the audio in a file original.wav :

  `rec -c 1 -r 16000 -b 16 original.wav`
  
  * This command records audio until ctrl+C is pressed
  
  * -c defines that sound is recorded in a single channel, -r defines 16000 sample-rate and -b defines 16-bit sample encoding

* Amplify the audio if it is not audible:
  
  `sox -v 256.0 original.wav amplified.wav`
  
  * This command amplifies 256 times (amplification works on logarithmic scale)
  
  * Amplified audio is saved in other file with name amplified.wav

* Trim out a noise sample from it :
  
  `sox amplified.wav noise.wav trim 0 0.5`
  
  * This command will trim out noise of length 0.5 seconds starting from 0 seconds and save it to the file noise.wav

* Create the noise profile :
  
  `sox noise.wav -n noiseprof noise.prof`

* Create cleaned audio after removing noise :
  
  `sox amplified.wav cleaned.wav noisered noise.prof 0.2`
  
  * You can set the noise removing parameter to any value. Usually 0.2 to 0.3 gives better results.

You can play the cleaned audio from terminal itself using the command :

`play cleaned.wav`

### Installing moses and its components for text translation between two languages:

Refer to README.pdf

### Train Moses for English-Hindi translation

Refer to README.pdf

### Hindi Text to Speech conversion using festival

Refer to README.pdf

## References:

* [https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/](https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/)
* [https://github.com/cmusphinx](https://github.com/cmusphinx)
* [http://cmusphinx.sourceforge.net/](http://cmusphinx.sourceforge.net/)
* [https://sourceforge.net/projects/cmusphinx/files/](https://sourceforge.net/projects/cmusphinx/files/)
* [http://cmusphinx.sourceforge.net/wiki/download](http://cmusphinx.sourceforge.net/wiki/download)
* [https://github.com/cmusphinx/sphinxbase](https://github.com/cmusphinx/sphinxbase)
* [https://github.com/cmusphinx/sphinxtrain](https://github.com/cmusphinx/sphinxtrain)
* [http://www.sphinx-doc.org/en/stable/install.html](http://www.sphinx-doc.org/en/stable/install.html)
* [http://cmusphinx.sourceforge.net/wiki/tutorialsphinx4](http://cmusphinx.sourceforge.net/wiki/tutorialsphinx4)
* [http://cmusphinx.sourceforge.net/wiki/sphinx4:webhome](http://cmusphinx.sourceforge.net/wiki/sphinx4:webhome)
* [http://sphinxsearch.com/docs/current/installing-debian.html](http://sphinxsearch.com/docs/current/installing-debian.html)
* [http://stackoverflow.com/questions/33453691/cmu-sphinx-for-indian-english](http://stackoverflow.com/questions/33453691/cmu-sphinx-for-indian-english)
* [http://www.keithv.com/software/sphinx/](http://www.keithv.com/software/sphinx/)
* [https://github.com/romanows/Sphinx-4-Acoustic-Model-Adaptation-Data](https://github.com/romanows/Sphinx-4-Acoustic-Model-Adaptation-Data)
* [http://www.speech.cs.cmu.edu/tools/lmtool.html](http://www.speech.cs.cmu.edu/tools/lmtool.html)
* [http://www.cfilt.iitb.ac.in/~moses/shata_anuvaadak/register.html](http://www.cfilt.iitb.ac.in/~moses/shata_anuvaadak/register.html)
* [https://en.wikipedia.org/wiki/ASR](https://en.wikipedia.org/wiki/ASR)
* [https://sourceforge.net/projects/cmusphinx/](https://sourceforge.net/projects/cmusphinx/)
* [https://sourceforge.net/projects/espeak/?source=typ_redirect](https://sourceforge.net/projects/espeak/?source=typ_redirect)
* [http://www.cstr.ed.ac.uk/projects/festival/](http://www.cstr.ed.ac.uk/projects/festival/)
* [https://oss.sonatype.org/content/repositories/snapshots/](https://oss.sonatype.org/content/repositories/snapshots/)
* [https://github.com/joshua-decoder/indian-parallel-corpora](https://github.com/joshua-decoder/indian-parallel-corpora)
* [https://oss.sonatype.org/](https://oss.sonatype.org/)
* [https://sourceforge.net/p/cmusphinx/discussion/help/thread/051151d0/](https://sourceforge.net/p/cmusphinx/discussion/help/thread/051151d0/)
