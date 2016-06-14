#java

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xEEA14886

sudo echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections

sudo apt-get update
sudo apt-get install oracle-java7-installer