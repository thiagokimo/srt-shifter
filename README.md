# SRT Shifter

[![Build Status](https://travis-ci.org/thiagokimo/srt-shifter.png)](https://travis-ci.org/thiagokimo/srt-shifter)
[![Gem Version](https://fury-badge.herokuapp.com/rb/srtshifter.png)](http://badge.fury.io/rb/srtshifter)

How many times you downloaded a movie that you couldn't find a perfect synchronized subtitle to watch it?

SRT Shifter is an open-source command-line tool that fixes the timming of your SubRip files!

##Pre-requisites

Install [Ruby Gems](https://rubygems.org/ "Ruby Gems") package manager installed in your system 

##Instalation

To install, just type:

    $ gem install srtshifter

## Usage

On the command-line, type the command below to get more information.

    $ srtshifter --help

This example generates a new srt file called new_sub.srt, with 2.5 milliseconds shifted ahead 
from original_sub.srt file.

    $ strshifter -o ADD -t 2.5 original_sub.srt new_sub.srt
    
## Future ideas and "to do"s'

1. Create a self-instalation script
2. Add more operations flexible operations (i.e: Edit specific part of the file)

##How to contribute
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. It is encouraged that you perform changes in a clean topic branch rather than a master and that you create a pull request for them. This will facilitate discussion and revision.

Please be clean, keep your commits atomic and with the smallest possible logical change. This will increase the likelihood of your submission to be used.

###Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug.

https://github.com/thiagokimo/srt-shifter/issues

##License
Copyright (c) 2012 Thiago Moreira Rocha.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to use, copy and modify copies of the Software, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
