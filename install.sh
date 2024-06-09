#!/bin/bash

yay -S nodejs npm
sudo npm i -g vscode-langservers-extracted
yay -S neovim tree-sitter
yay -S clang llvm llvm-libs python3 python-pip pyright bash-language-server lua-language-server

ln -s $(pwd)/nvim $HOME/.config/
