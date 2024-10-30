SecLab
===============

JupyterLab Docker Container with Multiple Kernels
---------------------------------------------------

A curated JupyterLab container that bundles popular kernels from various developers, providing a seamless experience for cyber security research and scientific computing alike.

**Table of Contents**

1. [Overview](#overview)
2. [Features](#features)
3. [Installation](#installation)
4. [Kernels and Dependencies](#kernels-and-dependencies)
5. [Build and Run](#build-and-run)

**Overview**
------------

This Docker container is designed to be a meta-project, combining the best of various Jupyter kernels to provide a comprehensive environment for various types of research, though primaraly aimed at cyber security research.

**Features**
------------

* Support for multiple programming languages:
	+ Typescript and Javascript (yunabe)
	+ Java (SpencerPark)
	+ Golang (gophernotes)
	+ C++/C Lua SQL SQLlite (xeus)
	+ Bash Script and Multi Kernel Notebooks (vatlab)
* Pre-installed dependencies, including apt utilities, vim, man, file, curl, wget, and golang-go (will be expanded soon)
* Maintained by Hunter Chasens

**Installation**
--------------

To install this container, follow these steps:

1. Clone the repository: `git clone https://github.com/hunterchasens/jupyterlab-kernels.git`
2. Build the Docker image: `docker build -t hunterchasens/jupyterlab-kernels .`
3. Run the container: `docker run -p 8888:8888 hunterchasens/jupyterlab-kernels`

**Kernels and Dependencies**
---------------------------

The following kernels are included in this container:

* Python
* C++ (also acts as our C kernel)
* Bash
* Golang
* Java
* Javascript
* TypeScript
* Julia
* Lua
* Pluto
* R
* SQL
* SQLlite

Future Kenrel Goals:
* Ruby
* Docker
* x64 Assembly

The following extensions are included in this container:
* Jupyterlab-SOS
* Transient-Display-Data
* (Many more to come!)

Additionally, the following dependencies have been pre-installed:

* apt utilities
* vim
* man
* file
* curl
* wget
* golang-go
* (with many more to come!)

**Build and Run**
------------------

To build and run this container, refer to the Dockerfile in the repository. The Dockerfile is designed to work with the `jupyter/datascience-notebook` base image.

Note: This README.md is subject to change as the project evolves. Please check the repository for the latest updates.
