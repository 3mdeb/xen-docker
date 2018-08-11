Docker environment for Xen development
======================================

This repository contains Dockerfiel with all dependencies and tools required
for building Xen.

## Building container

```
git clone git@github.com:3mdeb/xen-docker.git
cd xen-docker
docker build -t 3mdeb/xen-docker .
```

## Preparing build environment

First clone Xen source:

```
git clone git://xenbits.xen.org/xen.git
```

Add xen git directory as a volume to docker container and run it:

```
cd xen
docker run --rm -it -v $PWD:/home/xen -w /home/xen 3mdeb/xen-docker /bin/bash
```

> Note that xen source directory must be inside /home/xen in docker container
> as we also use .ccache as a volume in /home/xen.

## Building Xen

```
(xen-docker)$ git checkout <version>
(xen-docker)$ ./configure --enable-githttp --enable-systemd
# You can customize the config now if needed
(xen-docker)$ make debball
```

Result will be placed in `$(XEN_SRC)/dist`. You will find there:

* `install.sh` shell script which install Xen hypervisor on host machine
* `install` directory containing Xen components and kernel
* `xen-upstream-<version>.deb`

## Xen installation

To install Xen on host mashine simply run `install.sh` outside docker.

> Note: You need to have a Dom0 kernel for Xen on Your host

To install on a remote mashine use the `xen-upstream-<version>.deb` package.

Xen kernel will be placed in `/boot` directory in gzip format.