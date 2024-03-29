#!/bin/bash

sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev neovim libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3-dev meson
sudo apt-get install ninja-build

cd /usr/share/fonts/
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf
cd -

git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd ..

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

git clone https://github.com/tryone144/picom.git
cd picom
git checkout feature/dual_kawase
sudo meson --buildtype=release . build
sudo ninja -C build install
cd ../

pip3 install pywal

mkdir -p ~/.config/i3
mkdir -p ~/.config/compton
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
mkdir -p ~/.config/nvim
cp .config/i3/config ~/.config/i3/config
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp .config/compton/compton.conf ~/.config/compton/compton.conf
cp .config/rofi/config ~/.config/rofi/config
cp .config/picom/picom.conf ~/.config/picom/picom.conf
cp .config/nvim/init.vim ~/.config/nvim/init.vim
cp .fehbg ~/.fehbg

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
