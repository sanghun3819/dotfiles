# Dotfiles

## Requirements

```shell
sudo apt install -y \
    fish \
    tmux \
    git

chsh -s $(which fish)
```

Install neovim from [https://github.com/neovim/neovim]
```neovim
pip install pynvim msgpack python-language-server
```

## Optional

```shell
# for latex preview (evince-synctex)
pip install --user https://github.com/efoerster/evince-synctex/archive/master.zip

# CLI file manager
pip install ranger-fm

# coc-fzf-preview directory
sudo apt install -y ripgrep
```

## Usage

```shell
sh ./install.sh
```

## Helpful things

### sshfs

```shell
sudo apt install sshfs
sudo sshfs -o root@xxx.xxx.xxx.xxx:/ /mnt/mount_folder
sudo umount /mnt/mount_folder
```

### ranger + ueberzug

[https://github.com/ranger/ranger]  
[https://github.com/seebye/ueberzug]

```shell
# ueberzug
sudo apt-get install -y \
libx11-dev \
mesa-common-dev \
libglu1-mesa-dev \
libxrandr-dev \
libxi-dev

pip install ueberzug

# from ~/.config/ranger/rc.conf
set preview_images ueberzug
set preview_images_method ueberzug
```

### terminal image viewer (over ssh)

[https://github.com/hzeller/timg]

```shell
git clone https://github.com/hzeller/timg.git
cd timg/src
sudo apt-get install libwebp-dev libgraphicsmagick++-dev

# If you want to include video decoding
sudo apt-get install pkg-config libavcodec-dev libavformat-dev libswscale-dev

make WITH_VIDEO_DECODING=1
sudo make install
```
