local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  -- Simple plugins can be specified as strings
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  use "wbthomason/packer.nvim"
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'itchyny/lightline.vim'
  use 'altercation/vim-colors-solarized'
end)
