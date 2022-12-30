# My nvim setup

## Neovim version

Should nicely work with nvim 0.8.2

## Usage

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
