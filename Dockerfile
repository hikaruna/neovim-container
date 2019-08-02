FROM debian:stretch as builder

RUN apt-get update && apt-get install -y \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++ \
  pkg-config \
  unzip \
  patch

RUN mkdir /neovim
WORKDIR /neovim
COPY ./neovim ./
ENV CMAKE_BUILD_TYPE Release
RUN make


FROM debian:stretch-slim
RUN mkdir -p /opt/builds
COPY --from=builder /neovim/build /opt/builds/nvim

RUN ln -s /opt/builds/nvim/bin/* /usr/local/bin/.

RUN mkdir /root/work
WORKDIR /root/work

ENTRYPOINT [ "nvim" ]
