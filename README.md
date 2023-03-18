# My nvim setup

## Neovim version

Should nicely work with nvim 0.8.2

## Usage

1. Install NeoVIM
2. Install LUA
3. Install vim-plug: [vim-plug](https://github.com/junegunn/vim-plug)

If there are issues with the pretteir, make sure you have the eslint_d and prettier_d_slim installed globally with npm (along with prettier and eslint obviously)

```
npm install -g eslint_d
&&
npm install -g prettier_d_slim
```

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
