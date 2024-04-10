# FDC.vimrc

My .vimrc file

## Folder structure

This repo includes a serie of vim plugins as submodules
 * [mymalloc](https://github.com/fededc88/mymalloc.git)
 * [ack.vim](https://github.com/mileszs/ack.vim)
 * [ctrlp.vim](https://github.com/kien/ctrlp.vim)
 * [gruvbox](https://github.com/morhetz/gruvbox)
 * [molokai](https://github.com/tomasr/molokai)
 * [nerdtree](https://github.com/preservim/nerdtree)
 * [vim-airline](https://github.com/vim-airline/vim-airline)
 * [vim-fugitive](https://github.com/tpope/vim-fugitive)

in order to clone and get FDC.vimrc repo do:
```
git clone https://github.com/fededc88/FDC.vimrc.git --recurse-submodules -j<n_cores>
```
to install plugings just copy /plugin folter to 
```
~/vimfiles/pack/
```
and let vim > 8 do the rest.

## Dependencies

### 'ag' The Silver Searcher

'ag' is a code searching tool similar to ack, with a focus on speed. Install `ag` [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to be used with ack. 
