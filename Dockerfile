FROM debian:stable

MAINTAINER Piotr Król <piotr.krol@3mdeb.com>

RUN \
	useradd -p locked -m xen && \
	apt-get -qq update && \
	apt-get -qqy install \
		bcc \
		bin86 \
		bison \
		bridge-utils \
		build-essential \
		bzip2 \
		ccache \
		e2fslibs-dev \
		flex \
		gawk \
		gcc \
		gettext \
		git-core \
		iasl \
		iproute2 \
		libaio-dev \
		libbz2-dev \
		libc6-dev \
		libc6-dev-i386 \
		libcurl4 \
		libcurl4-openssl-dev \
		liblzma-dev \
		libncurses5-dev \
		libpixman-1-dev \
		libsdl-dev \
		libsystemd-dev \
		libvncserver-dev \
		libx11-dev \
		libyajl-dev \
		make \
		markdown \
		mercurial \
		meson \
		ocaml \
		ocaml-findlib \
		pandoc \
		patch \
		libpci-dev \
		python \
		python-dev \
		python3-dev \
		texinfo \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-latex-base \
		texlive-latex-recommended \
		tgif \
		transfig \
		uuid-dev \
		wget \
		xz-utils \
		zlib1g-dev \
	&& apt-get clean

ENV PATH="/usr/lib/ccache:${PATH}"
RUN mkdir /home/xen/.ccache && \
	chown xen:xen /home/xen/.ccache

USER xen
