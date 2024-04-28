# Install Iosevka Font
cd ~/Downloads
wget https://github.com/be5invis/Iosevka/releases/download/v29.2.1/PkgTTC-Iosevka-29.2.1.zip
unzip PkgTTC-Iosevka-29.2.1.zip -d Iosevka
mkdir -p ~/.local/share/fonts
cp Iosevka/*.ttc ~/.local/share/fonts
fc-cache

# Git config
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status


# Update and get good default set of packages
sudo apt update -y
sudo apt install -y \
  git curl \
  build-essential pkg-config autoconf bison rustc cargo clang \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libcurses5-dev libffi-dev \

# GUI applications
sudo snap install spotify vlc
