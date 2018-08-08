FROM debian:stable

MAINTAINER Piotr Król <piotr.krol@3mdeb.com>

RUN \
	useradd -p locked -m xen && \
	apt-get -qq update && \
	apt-get -qqy install \
		build-essential \
		bcc \
		bin86 \
		gawk \
		bridge-utils \
		iproute \
		libcurl3 \
		libcurl4-openssl-dev \
		bzip2 \
		transfig \
		tgif \
		texinfo \
		texlive-latex-base \
		texlive-latex-recommended \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		pciutils-dev \
		mercurial \
		make \
		gcc \
		libc6-dev \
		zlib1g-dev \
		python \
		python-dev \
		python-twisted \
		libncurses5-dev \
		patch \
		libvncserver-dev \
		libsdl-dev \
		iasl \
		libbz2-dev \
		e2fslibs-dev \
		git-core \
		uuid-dev \
		ocaml \
		ocaml-findlib \
		libx11-dev \
		bison \
		flex \
		xz-utils \
		libyajl-dev \
		gettext \
		libpixman-1-dev \
		libaio-dev \
		markdown \
		pandoc \
	&& apt-get clean

RUN mkdir /home/xen/.ccache && \
	chown xen:xen /home/xen/.ccache

VOLUME /home/coreboot/.ccache
USER xen
