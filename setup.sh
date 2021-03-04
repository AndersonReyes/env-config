# install cli deps
sudo apt install gnupg2 software-properties-common
udo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y git vim tmux gh fzf gcc wget curl xclip xsel
