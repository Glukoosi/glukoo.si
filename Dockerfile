FROM debian:stretch as builder

ENV HUGO_VERSION 0.52
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb


ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
&& rm /tmp/hugo.deb

RUN mkdir /usr/share/site
WORKDIR /usr/share/site

ADD ./site /usr/share/site
RUN hugo

FROM nginx as prod
COPY --from=builder /usr/share/site/public /usr/share/nginx/html
