# Custom nvim configurations

## Requirements

* [Install Nvim Paq Package manager](https://github.com/savq/paq-nvim)
* Install npm (necessary for lsp installation)

## Install

1. Clone the repo into your nvimrc directory (This file includes it's own init.lua, if you already have one you may like to merge them or delete the existing one)
```bash
sudo sh -c 'mkdir -p ~/.config/nvim && git clone https://github.com/franyol/Nvim-Configs.git ~/.config/nvim-temp && mv ~/.config/nvim-temp/.* ~/.config/nvim/ 2>/dev/null && mv ~/.config/nvim-temp/* ~/.config/nvim/ && rm -rf ~/.config/nvim-temp'
```
2. Open nvim
```
nvim
```
3. Install the packages
```
:PaqInstall
```
 
## Features

* [Rose pine](https://github.com/rose-pine/neovim)

* [LSP Zero](https://github.com/VonHeikemen/lsp-zero.nvim)

* Ctrl-F remap to open a block {} easily
* Ctrl-HJKL remaps for scrolling

The rest of the configurations is vanilla, I may add other cool plugins like harpoon and telescope sometime.
