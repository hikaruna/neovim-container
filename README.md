Neovim docker image.

## Usage

```docker run -it --rm -v ${your_workspace}:/work hikaruna/neovim hello.txt```

## Usage multi stage build

```
FROM {debian:stretch-slim|alpine}
RUN mkdir -p /opt/builds
COPY --from=hikaruna/neovim:{stretch|alpine} /opt/builds/nvim /opt/builds/.

RUN ln -s /opt/builds/nvim/bin/nvim /usr/local/bin/nvim
RUN ln -s /usr/local/bin/nvim /usr/local/bin/vim
RUN ln -s /usr/local/bin/vim /usr/local/bin/vi
```
