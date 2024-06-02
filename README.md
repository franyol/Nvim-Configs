# Custom nvim configurations

## Requirements

* Install Nvim Paq Package manager

If you are using some Arch-based distro like me (Manjaro XFCE), use the following command:

```
sudo git clone --depth=1 https://github.com/savq/paq-nvim.git \
    /usr/local/share/nvim/site/pack/paqs/start/paq-nvim
```

Otherwise clone the package to the usual path:

```
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
```
  
* Install npm (necessary for lsp installation)

pacman:
```
sudo pacman -S npm
```

## Install

1. Clone the repo into your nvimrc directory (This file includes it's own init.lua, if you already have one you may like to merge them or delete the existing one)
```bash
sh -c 'mkdir -p $HOME/.config/nvim && git clone https://github.com/franyol/Nvim-Configs.git $HOME/.config/nvim-temp && mv $HOME/.config/nvim-temp/.* $HOME/.config/nvim/ 2>/dev/null && mv $HOME/.config/nvim-temp/* $HOME/.config/nvim/ && rm -rf $HOME/.config/nvim-temp'
```
2. Open nvim
```
nvim
```
You will get an error due to some packages not being installed, for now ignore it and press enter:
![image](https://github.com/franyol/Nvim-Configs/assets/94434464/4ae25018-5f2a-499b-9963-d812d0577092)

3. Install the packages
```
:PaqInstall
```
![image](https://github.com/franyol/Nvim-Configs/assets/94434464/1ef93b8b-afab-475f-afd3-3f44fc506cf2)

When it ends all packages beside lsp servers will be installed, just quit nvim `:q!` and reopen it `nvim` to the servers to start it's installation.
 
## Features

* [Rose pine](https://github.com/rose-pine/neovim)

* [LSP Zero](https://github.com/VonHeikemen/lsp-zero.nvim)

* Ctrl-F remap to open a block {} easily
* Ctrl-HJKL remaps for scrolling

The rest of the configurations is vanilla, I may add other cool plugins like harpoon and telescope sometime.
