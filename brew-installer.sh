#!/bin/sh

exec brew install coreutils \
  binutils \
  diffutils \
  ed \
  findutils \
  gawk \
  gnu-indent \
  gnu-sed \
  gnu-tar \
  gnu-which \
  ripgrep \
  gzip \
  screen \
  tmux \
  watch \
  wdiff \
  curl \
  wget \
  bash \
  gdb \
  gpatch \
  m4 \
  make \
  file-formula \
  git \
  less \
  openssh \
  python \
  rsync \
  unzip \
  vim \
  gpg \
  jq \
  bash \
  golang \
  kubectl \
  gh \
  pandoc \
  nmap \
  fd \

echo "Now don't forget:"
echo "  Add /usr/local/bin/bash to /etc/shells"
echo "  Run chsh -s /usr/local/bin/bash"
echo "  Use #!/usr/bin/env bash as shebang line"
