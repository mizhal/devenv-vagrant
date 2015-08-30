#!/bin/bash
KEYDIR=~/.ssh/keys
rm $KEYDIR -rf
mkdir $KEYDIR
cp /media/vagrant_shared/ssh/keys/* $KEYDIR -R
chmod go-rwx $KEYDIR -R
cp /media/vagrant_shared/ssh/config ~/.ssh
## Anyadir a sesion las identidades (archivos que no tengan extension pub)
echo 'ssh-add `find ~/.ssh/keys | grep -v ".*[.]pub"`' >> ~/.bashrc