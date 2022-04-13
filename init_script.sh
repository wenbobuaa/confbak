# git
apt-get -y install git

# conf
git clone https://gitee.com/wenbobuaa/confbak.git
cp confbak/.gitconfig ~/.
cp confbak/.zshrc ~/.
cp confbak/.vimrc ~/.

# zsh
apt-get -y install zsh
chsh -s /bin/zsh

# oh-my-zsh
git clone https://gitee.com/mirrors/oh-my-zsh.git
cd oh-my-zsh
cd tools
./install.sh
# -- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/lightnear/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# -- git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitee.com/xiaoqqya/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 

# openvpn
## execute in a host can access to github.com
git clone https://github.com/OpenVPN/openvpn3-linux
cd openvpn3-linux
./bootstrap.sh
scp openvpn3-linux youhost:~/.

## execute in the host to install openvpn
## requirements install: https://github.com/OpenVPN/openvpn3-linux
cd openvpn3-linux
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
make && make install

## openvpn usage: https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux

# goup
./install_goup.sh
goup install 1.15

# vim
apt-get -y install vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
#wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O /usr/local/bin/nvim.appimage
#chmod u+x /usr/local/bin/nvim.appimage
#ln -s /usr/local/bin/nvim.appimage /usr/local/bin/nvim
#ln -s /usr/local/bin/nvim /usr/local/bin/vim

