FROM alpine as builder

RUN apk add --update --no-cache \
alpine-sdk \
autoconf \
automake \
cmake \
gettext-dev \
libintl \
libtool \
m4

RUN mkdir /neovim
WORKDIR /neovim
COPY ./neovim ./
ENV CMAKE_BUILD_TYPE Release
RUN make


FROM alpine
RUN mkdir -p /opt/builds
COPY --from=builder /neovim/build /opt/builds/nvim

RUN ln -s /opt/builds/nvim/bin/* /usr/local/bin/.

RUN mkdir /root/work
WORKDIR /root/work

ENTRYPOINT [ "nvim" ]
