#!/bin/bash

wget https://download.sublimetext.com/Sublime%20Text%202.0.2%20x64.tar.bz2 -O sublime.tar.bz2
bunzip2 sublime.tar.bz2
tar xvf sublime.tar

sudo mv Sublime\ Text\ 2 /opt/
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /bin/sublime_text