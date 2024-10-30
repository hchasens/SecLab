FROM jupyter/datascience-notebook:notebook-7.2.2

LABEL version="0.1"
LABEL description="This container aims to be a cursed amalgimation of jupyter kernels."
MAINTAINER ="Hunter Chasens <admin@hunterchasens.com>"

### Source List
# https://github.com/yunabe/tslab 		- 	Typescript Javascript Support
# https://github.com/SpencerPark/IJava 		- 	Java Support
# https://github.com/gopherdata/gophernotes	-	Golang Support
# https://github.com/jupyter-xeus		- 	C++ C SQL SQLlite Support
# https://github.com/vatlab			-	Bash and Multi Kernel Support
# Jupyter Project
# Ubuntu Project


USER root

WORKDIR /tmp/

RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:longsleep/golang-backports

RUN apt update
RUN apt install -y apt-utils net-tools vim man file curl wget golang-go openjdk-21-jre openjdk-21-jdk openjdk-21-doc



USER ${NB_UID}

# Loose Kernels
## Javascript / Typescript
RUN npm install -g tslab
RUN tslab install


## Java
RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
RUN mkdir ijava && cd ijava && unzip ../ijava-1.3.0.zip
RUN sudo python3 install.py

## Gophernotes - Golang
RUN <<EOT
go install github.com/gopherdata/gophernotes@v0.7.5
mkdir -p ~/.local/share/jupyter/kernels/gophernotes
cd ~/.local/share/jupyter/kernels/gophernotes
cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "."
chmod +w ./kernel.json # in case copied kernel.json has no write permission
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
EOT


# Xeus Packages - C++/C Lua SQL SQLlite
RUN mamba install -y xeus xeus-sqlite xeus-sql xeus-lua xeus-cling -c conda-forge

# SoS Conda Packages - Bash Script + Multi Kernel Notebooks
RUN mamba install -y  sos sos-notebook jupyterlab-sos jupyterlab-transient-display-data sos-bash sos-python sos-r -c conda-forge

WORKDIR "${HOME}"

