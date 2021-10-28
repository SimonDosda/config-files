echo ¨copy folder¨
mv ${PWD} ~/.config-files
cd ~/.config-files

echo ¨add keys¨
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common

echo "update registry"
sudo apt update

echo "install vim"
sudo apt install -y vim

echo "install git"
sudo apt install -y git

echo "install xclip"
sudo apt install -y xclip

echo "install oh my zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "modify geoffgarside theme"
cp geoffgarside.zsh-theme ~/.oh-my-zsh/themes/geoffgarside.zsh-theme

echo "install tmux"
sudo apt install -y tmux

echo "install zsh"
sudo apt install -y zsh

echo "install curl"
sudo apt install -y curl

echo "install kubectl"
sudo apt install -y kubectl

echo "install docker"
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

echo "install pyenv"
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


echo "change keyboard"
sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us-save
sudo cp us /usr/share/X11/xkb/symbols/  

echo "install gnome tweaks"
sudo apt install -y gnome-tweaks

echo "install n"
curl -L https://git.io/n-install | N_PREFIX=~/.n/ bash -s -- lts

echo "install psql"
sudo apt install -y postgresql-client libpq-dev

echo "install angular cli"
npm install -g @angular/cli

cd ~/.oh-my-zsh
git add -A
git commit -m 'update theme'
cd ~/.config-files

echo ¨install VS Code¨
sudo apt install code

echo "set zsh"
ln .zshrc ~/.zshrc
source ~/.zshrc

echo "set git config"
ln .gitconfig  ~/.gitconfig  

echo "set vimrc"
ln .vimrc   ~/.vimrc     

echo "set tmux.conf"
ln .tmux.conf   ~/.tmux.conf     

echo "generate SSH key"
ssh-keygen -t rsa -b 4096 -C "sdosda@gmail.com"

echo "copy ssh key to keyboard"
xclip -sel clip < ~/.ssh/id_rsa.pub

