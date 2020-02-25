sudo apt-get update; sudo apt-get install -y tmux curl zsh ruby-dev git terminator vim python-pip xclip ctags ack-grep
sudo gem install tmuxinator
#sudo pip install cheat
wget https://github.com/cheat/cheat/releases/download/3.5.1/cheat-linux-amd64.gz
gunzip cheat-linux-amd64.gz && sudo mv ./cheat-linux-amd64 /usr/local/bin/cheat
sudo chmod +x /usr/local/bin/cheat
mkdir -p ~/.config/cheat/
mv cheat-conf.yaml ~/.config/cheat/conf.yml
rm -rf ~/.oh-my-zsh/
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)
git clone https://github.com/rewiko/.tmux.git
cp .tmux/.tmux.conf ~/
cp .tmux/.tmux.conf.local ~/
cp -r .tmuxinator ~/
cp -r terminator ~/.config
cp .zshrc ~/
cp .zshenv ~/
mkdir -p ~/work
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
git clone https://github.com/rewiko/myvimrc.git ~/myvimrc
cd ~/myvimrc ; ./install.sh
git clone https://rewiko@bitbucket.org/rewiko/cheatsheet.git ~/.cheat/personal/
git  clone https://github.com/cheat/cheatsheets.git  ~/.cheat/community/
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
