# update system
sudo pacman -Syu --noconfirm

# remove all unneccessary packages
sudo pacman -Rs cachyos-fish-config --noconfirm

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
stow .

rebos gen commit "init"
rebos gen current build

# change to zsh for new user
sudo chsh -s /usr/bin/zsh
sudo usermod -G wheel -s /bin/zsh $USER

# scheduler thing
systemctl disable --now ananicy-cpp
dbus-send --system --print-reply --dest=org.scx.Loader /org/scx/Loader org.scx.Loader.StartScheduler string:scx_lavd uint32:0
