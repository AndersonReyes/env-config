# install cli deps
sudo apt install gnupg2 software-properties-common
udo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y git vim tmux gh gcc wget curl xclip bash-completion

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
