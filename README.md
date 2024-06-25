Configuration files for NeoVim 0.9.x.


## Installation
1. `cd ~/.config/` or `cd C:/Users/UserName/AppData/Local/` on Windows
 - to know where the `nvim` folder must go, you can also run `:echo stdpath("config")` in NeoVim.
2. `git clone https://github.com/AdrienPlacais/nvim.git`
3. Install `Plug`: https://github.com/junegunn/vim-plug
 - use the provided one-liner, it is easier ;)
4. Launch NeoVim and run `:PlugInstall`
5. The LSPs should be automatically downloaded. If not, maybe NeoVim does not know where your Python distribution is. You can test it by running `:checkhealth provider`.

## To do
- [ ] Automatic installation of `treesitter` parsers. For now, you need to manually `:TSInstall python`, `:TSInstall lua`, etc.

## Troubleshooting
- If `latexindent` is now working, check that a `.indentconfig.yaml` in you `$HOME` directory points towards the `my_indentconfig.yaml` file of this repo.
- Check that `ls /usr/lib64/libcrypt.so.1` exists.
