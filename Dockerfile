FROM quay.io/jupyter/datascience-notebook:notebook-7.2.2

LABEL name="SecLab"
LABEL description="A curated JupyterLab container for security research."
MAINTAINER ="Hunter Chasens <hunter.chasens18@ncf.edu>"

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


# Add Kali Tools (We use Snapshots for Stability)
# @TODO remove version dependency

RUN echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware" | tee /etc/apt/sources.list
RUN wget https://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2024.1_all.deb
RUN dpkg -i kali-archive-keyring_2024.1_all.deb
COPY ubuntu.perf /etc/apt/preferences.d/ubuntu.perf

RUN apt update && apt upgrade -y 		# This might break things
RUN apt --fix-broken install -y kali-linux-headless


USER ${NB_UID}

## Javascript / Typescript
RUN npm install -g tslab
RUN tslab install --prefix /opt/conda/


## Java
RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
RUN mkdir ijava && unzip ijava-1.3.0.zip -d ijava
RUN python3 ijava/install.py --prefix /opt/conda/


## Gophernotes - Golang
RUN go install github.com/gopherdata/gophernotes@latest
RUN mkdir -p /opt/conda/share/jupyter/kernels/gophernotes
WORKDIR /opt/conda/share/jupyter/kernels/gophernotes
RUN cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "."
RUN chmod +w ./kernel.json # in case copied kernel.json has no write permission
RUN sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
WORKDIR /tmp/

# Xeus Packages - C++/C Lua SQL SQLlite
RUN mamba install -y xeus xeus-sqlite xeus-sql xeus-lua xeus-cling -c conda-forge

# SoS Conda Packages - Bash Script + Multi Kernel Notebooks
RUN mamba install -y  sos sos-notebook jupyterlab-sos jupyterlab-transient-display-data sos-bash sos-python sos-r -c conda-forge
RUN jupyter labextension disable ipyparallel-labextension	# Removes distributed computing panel (cluter for most people)

# Extentions Here
# Latex Needed

USER ${NB_UID}

WORKDIR "${HOME}"

