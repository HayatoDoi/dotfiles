FROM --platform=amd64 ubuntu:24.04

ARG _USER="devuser"
ARG _HOME="/home/${_USER}"

RUN apt update && apt install -y zsh eza neovim tmux sudo \
    openssh-server git

# SSHのための作成
RUN mkdir /var/run/sshd
RUN useradd -m -s /usr/bin/zsh ${_USER} && \
    echo ${_USER}:${_USER} | chpasswd
RUN usermod -aG sudo ${_USER}
RUN echo "${_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# SSH公開鍵認証用ディレクトリ作成
RUN mkdir -p ${_HOME}/.ssh
RUN chmod 700 ${_HOME}/.ssh

RUN git clone https://github.com/HayatoDoi/dotfiles.git ${_HOME}/.dotfiles
RUN ln -s ${_HOME}/.dotfiles/zshrc/main.zsh ${_HOME}/.zshrc
RUN ln -s ${_HOME}/.dotfiles/tmux.conf ${_HOME}/.tmux.conf
RUN mkdir -p ${_HOME}/.config/nvim
RUN ln -s ${_HOME}/.dotfiles/vimrc ${_HOME}/.config/nvim/init.vim
RUN mkdir ${_HOME}/.bin
RUN mkdir touch ${_HOME}/.bin/include_path.zsh
RUN echo 'export DOTFILES_COLOR_THEME_USER="VIOLET"' >> ${_HOME}/.dotfile_setting.zsh

RUN chown -R ${_USER}:${_USER} /home/${_USER}/
