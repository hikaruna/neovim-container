Neovim docker image.

## Usage

```docker run -it --rm -v ${your_workspace}:/work hikaruna/neovim:xxx hello.txt```

## Usage multi stage build

### Base is debian:stretch

```
FROM debian:stretch-slim
COPY --from=hikaruna/neovim:stretch /neovim/build /usr/local/neovim

RUN ln -s /usr/local/neovim/bin/nvim /usr/local/bin/nvim
RUN ln -s /usr/local/bin/nvim /usr/local/bin/vi
```
