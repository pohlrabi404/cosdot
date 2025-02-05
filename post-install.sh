# update system
sudo pacman -Syu --noconfirm

# remove all unneccessary packages
sudo pacman -Rs cachyos-fish-config --noconfirm
sudo pacman -Rs plymouth cachyos-plymouth-theme --noconfirm

# paru
sudo pacman -S paru --noconfirm

# git (already with paru but for completion's sakes)
sudo pacman -S git --noconfirm

# stow
sudo pacman -S stow --noconfirm

# rebos
sudo paru -S rebos-git --noconfirm
rebos setup

# clone git repo
cd ~/
git clone https://github.com/pohlrabi404/cosdot.git .dotfiles
cd .dotfiles
stow files

rebos gen commit "init"
rebos gen current build

# greetd
sudo rm -rf /etc/greetd
sudo mkdir -p /etc/greetd
sudo cp -r greetd /etc/greetd
sudo systemctl enable greetd
sudo usermod -a -G video greeter
sudo chown greeter /etc/greetd

# tldr
tldr --update

# change to zsh for new user
sudo chsh -s /usr/bin/zsh
sudo usermod -a -G wheel,audio,video -s /bin/zsh $USER

# scheduler thing
systemctl disable --now ananicy-cpp
dbus-send --system --print-reply --dest=org.scx.Loader /org/scx/Loader org.scx.Loader.StartScheduler string:scx_lavd uint32:0

# cursors
cp -r ./icons ~/.local/share/

sudo rm -r /etc/anyrun

ya pack -a bennyyip/gruvbox-dark

reboot
