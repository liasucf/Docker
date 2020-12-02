# Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \y
sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
