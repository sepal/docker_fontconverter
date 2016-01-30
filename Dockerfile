FROM gliderlabs/alpine:3.3
RUN echo "ipv6" >> /etc/modules
RUN apk add --update bash
RUN apk add --update build-base wget git freetype freetype-dev
RUN cd /root && git clone https://github.com/adafruit/Adafruit-GFX-Library.git
WORKDIR /root/Adafruit-GFX-Library/fontconvert/
RUN sed -i 's:-I.*$:-I/usr/include/freetype2/:g' Makefile
RUN sed -i 's:*/:*/\n\n#include <stdint.h>:' fontconvert.c
RUN make all
RUN cp fontconvert /usr/bin/
RUN mkdir /fonts
VOLUME ./:/fonts
WORKDIR /fonts
CMD fontconvert *.ttf 9
