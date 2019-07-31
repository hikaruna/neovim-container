FROM debian:stretch-slim

RUN apt-get update && apt-get install -y \
  ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
  git \
  patch \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git
WORKDIR /neovim

ENV CMAKE_BUILD_TYPE Release
RUN make

RUN mkdir /work
WORKDIR /work

ENTRYPOINT [ "/neovim/build/bin/nvim" ]
