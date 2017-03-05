sudo apt-get update; sudo apt-get install -y tmux curl zsh ruby-dev git terminator vim
sudo gem install tmuxinator
rm -rf ~/.oh-my-zsh/
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)
cp .tmux.conf ~/
cp -r .tmuxinator ~/
cp -r terminator ~/.config
cp .zshrc ~/
mkdir -p ~/work
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
git clone https://github.com/rewiko/myvimrc.git ~/myvimrc
cd ~/myvimrc ; ./install.sh
