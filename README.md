# VIM Zoom v0.3.1

A simple plugin to toggle zoom of current window within the current tab.

This is heavily inspired from tmux's zoom pane feature.

## Installation

Use your favorite plugin manager to install this plugin (recommended).

#### [pathogen.vim](https://github.com/tpope/vim-pathogen)
```
git clone https://github.com/dhruvasagar/vim-zoom.git ~/.vim/bundle/vim-zoom
```

If however you don't use a plugin manager such as pathogen, vundle, neobundle,
vim-plug then you can copy all files within this repository directly within
your ~/.vim folder. (not recommended)

## Usage

Simply use the provided mapping <kbd>\<C-W>m</kbd> to toggle zoom in and out
for the current window

### Statusline

VIM Zoom provides `zoom#statusline()` API to be used for adding
`g:zoom#statustext` value to your statusline while your window is zoomed.
`g:zoom#statustext` defaults to value `'status'`. You may add this to your
statusline like this :

`set statusline+=%{zoom#statusline()}`

If you're using some complex statusline plugin, you may need to refer to it's
documentation to figure out how to add this to your statusline.

## Contributing

### Reporting an Issue :

Use <a href="https://github.com/dhruvasagar/vim-zoom/issues">Github Issue
Tracker</a>

### Contributing to code :

- Fork it.
- Commit your changes and give your commit message some love.
- Push to your fork on github.
- Open a Pull Request.

## Credits

This plugin was heavily inspired by tmux's zoom pane feature.
