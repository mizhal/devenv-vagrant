#!/bin/bash

## uml tools

sudo apt-get install -y graphviz imagemagick

PLANTUML_DOWNLOAD_URL=http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

wget $PLANTUML_DOWNLOAD_URL -O plantuml.jar

sudo mv plantuml.jar /opt/plantuml.jar

sudo echo 'java -jar /opt/plantuml.jar $1 $2 $3 $4 $5 $6' > /bin/plantuml
sudo chmod +x /bin/plantuml