# zsh
apt-get -y install zsh
chsh -s /bin/zsh

# git
apt-get -y git

# oh-my-zsh
git clone https://gitee.com/mirrors/oh-my-zsh.git
cd oh-my-zsh
cd tools
./install.sh

# -- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/lightnear/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# -- git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitee.com/xiaoqqya/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 

# conf
git clone https://gitee.com/wenbobuaa/confbak.git

cp confbak/.gitconfig ~/.
cp confbak/.zshrc ~/.
cp confbak/.vimrc ~/.
