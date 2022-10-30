" Load vim-plug
source ~/.config/nvim/plug.vim

let config_files = split(glob('~/.config/nvim/configs/**/' . '*.vim'))
for file in config_files
  execute 'source' file
endfor
