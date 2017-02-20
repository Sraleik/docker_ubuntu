FROM registry.gitlab.com/sraleik/docker_ubuntu:16.04-simple
MAINTAINER Sraleik <sraleik@gmail.com>

RUN apt-add-repository ppa:fish-shell/release-2 -y && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get --no-install-recommends -yq install \
      fish && \
    rm -rf /var/lib/apt/lists/*

# INSTALL node and npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# INSTALL pretty git diff
RUN npm install -g diff-so-fancy

# CREATION user sraleik
RUN useradd --shell /usr/bin/fish -u 1000 -o -c "" -m sraleik
RUN usermod -aG sudo sraleik
RUN echo 'sraleik ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sraleik

RUN git config --global user.email "nicolas.rotier@gmail.com" && \
    git config --global user.name "Sraleik" && \
    git config --global push.default simple && \
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" && \
    git config --global color.ui "always" && \
    git config --global color.diff.meta "yellow bold" && \
    git config --global color.diff.commit "green bold" && \
    git config --global color.diff.frag "magenta bold" && \
    git config --global color.diff.old "red bold" && \
    git config --global color.diff.new "green bold" && \
    git config --global color.diff.whitespace "green bold" && \
    git config --global color.diff-highlight.oldNormal "red bold" && \
    git config --global color.diff-highlight.oldHighlight "red bold 52" && \
    git config --global color.diff-highlight.newNormal "green bold" && \
    git config --global color.diff-highlight.newHighlight "green bold 22"

RUN mkdir -p /home/sraleik/.config && sudo chown -R sraleik:sraleik /home/sraleik/.config
WORKDIR /home/sraleik/.config

RUN git clone https://gitlab.com/Sraleik/fishConfig.git fish

WORKDIR /home/sraleik/
