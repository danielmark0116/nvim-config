# My nvim setup

## Neovim version

Should nicely work with nvim 0.8.2

## Usage

1. Install NeoVIM
2. Install LUA
3. Install TMUX and copy .tmux.conf to ~/.tmux-conf `cp .tmux.conf ~/.tmux.conf`
  - with tpm: [tpm](https://github.com/tmux-plugins/tpm)
  - install plugins: [install plugs for tmux](https://github.com/tmux-plugins/tpm#installing-plugins)
4. Install vim-plug: [vim-plug](https://github.com/junegunn/vim-plug)
5. Add languages `:TSInstall vim | javascript | typescript etc`
6. Install plugins with :PlugInstall
7. Afterwards, overwrite `.local/share/nvim/plugged/lspsaga` with the ZIP fromthis commit: [lspsaga](https://github.com/glepnir/lspsaga.nvim/commit/b7b4777369b441341b2dcd45c738ea4167c11c9e)
  - just downlaod archive's ZIP instead of `git clone`, unzip and copy `cp -r lspsaga ~/.local.../lspsaga.nvim`
  - new version has breaking changes and it is not yet addresed in this config :C


If there are issues with the pretteir, make sure you have the eslint_d and prettier_d_slim installed globally with npm (along with prettier and eslint obviously)

```
npm install -g eslint_d
&&
npm install -g prettier_d_slim
&&
npm install -g diagnostic-languageserver
&&
npm install -g typescript-language-server
&&
brew install deno
```

Dont use node lower than 14

You can use `asdf` or `nvm` to change node ver per session

Setup has issues with prettier version higher than 1.19.1

---

If you happen to find yourself in situations when the eslint version changes and the lsp + eslint_d seem not to work correctly, you can try restarting the setup with:

```bash
eslint_d restart
```

## Working :Rg with telescope

In order to have the Telescope live_grep working, you need to:

```
brew install ripgrep
```

## Possible issues

Defx might have issues with python3 not visible, try running this in such a case:

python3 -m pip install --user --upgrade pynvim

## Elixir

Use this guide: 
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls
