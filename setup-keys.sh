#!/bin/bash
KEYDIR=~/.ssh/keys
rm $KEYDIR -rf
mkdir $KEYDIR
cp /media/vagrant_shared/keys/private/* $KEYDIR -R
chmod go-rwx $KEYDIR/* -R
cp /media/vagrant_shared/keys/config ~/.ssh
