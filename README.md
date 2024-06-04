Configuration files for NeoVim 0.9.x.


## Installation
1. `cd ~/.config/` or `cd C:/Users/UserName/AppData/Local/` on Windows
 - to know where the `nvim` folder must go, you can also run `:echo stdpath("config")` in NeoVim.
2. `git clone https://github.com/AdrienPlacais/nvim.git`
3. Install `Plug`: https://github.com/junegunn/vim-plug
 - use the provided one-liner, it is easier ;)
4. Launch NeoVim and run `:PlugInstall`
5. The LPS should be automatically downloaded. If not, maybe NeoVim does not know where your Python distribution is. You can test it by running `:checkhealth provider`.
