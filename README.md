SecLab
===============

PenTesting Focused JupyterLab with Multiple Kernels
---------------------------------------------------

A curated JupyterLab container that bundles popular kernels from various developers, providing a seamless experience for cyber security research, PenTesting, and scientific computing alike.

**Table of Contents**

1. [Overview](#overview)
2. [Features](#features)
3. [Installation](#installation)
4. [Kernels and Dependencies](#kernels-and-dependencies)
5. [Build and Run](#build-and-run)
6. [Roadmap](#roadmap)
7. [License](#license)

**Overview**
------------

This Docker container is designed to be a meta-project, combining the best of various Jupyter kernels, along with locally isntalled tools, to provide a comprehensive environment for various types of research, though primaraly aimed at cyber security research.

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

@TODO - Fill out docker documentation

`docker pull ghcr.io/hchasens/seclab:v0.0.2`

An example `docker-compose.yaml` might look like the following: 

```yaml
services:
  SecLab:
    image: ghcr.io/hchasens/seclab:v0.0.2
    container_name: jupyter_lab
    user: root
    working_dir: "/home/hchasens"
    ports:
      - "8888:8888"
    environment:
      - NB_USER=hchasens
      - CHOWN_HOME=yes
      - CHOWN_EXTRA=/home/hchasens
      - GEN_CERT=yes
      - JUPYTER_ENABLE_LAB=yes
      - RESTARTABLE=yes
      - GRANT_SUDO=yes
    volumes:
      - /srv/jupyter:/home/hchasens/
    restart: unless-stopped
```


Refer to JupyterLab Docker docs for more details (until this section is filled out). 

Note: It might be beneficial to open several ports to allow for a reverse shell.

@TODO - Add docker-compose.yaml file

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
* Jupyterlab-SOS (allowing for multi-kernel notebooks)
* Transient-Display-Data
* (Many more to come!)

Additionally, the following dependencies and programs have been pre-installed:

<details>
  <summary>Click to Expand List</summary>

7zip aircrack-ng apache2 arp-scan arping atftpd axel bind9-dnsutils binwalk bluez bluez-hcidump bully cadaver cewl chntpw cifs-utils clang  creddump7 crunch  cryptsetup cryptsetup-initramfs cryptsetup-nuke-password default-mysql-server dirb dmitry dns2tcp dnsenum dnsrecon dos2unix ethtool exiv2 expect ffuf fierce fping gdisk git hashcat hashdeep hashid  hping3 hydra i2c-tools ifenslave ike-scan  inetsim iodine iw john libimage-exiftool-perl macchanger magicrescue maskprocessor masscan minicom miredo mitmproxy  nasm nbtscan ncrack ncurses-hexedit netdiscover netmask netsed netsniff-ng nfs-common ngrep nikto nmap onesixtyone openvpn patator php php-mysql pixiewps plocate proxychains4 proxytunnel ptunnel python-is-python3 python3-impacket python3-pip python3-scapy python3-virtualenv radare2 rake reaver redsocks rfkill samba samdump2 sbd scalpel screen scrounge-ntfs sendemail sleuthkit smbmap snmp snmpd socat sqlmap ssldump sslh sslscan sslsplit statsprocessor stunnel4 swaks tcpick tcpreplay telnet testdisk tftp-hpa thc-ipv6  traceroute udptunnel unrar unar upx-ucl vboot-kernel-utils vboot-utils vim vlan vpnc wafw00f weevely wfuzz whatweb whois wifite xxd netcat tcpdump curl wget gobuster 

</details>

With many more to come! The end goal will be to create a kali-like environment, such that users who are familiar with Kali will feel at home using this project.

Our roadmap includes adding tools/libs like Metasploit, SecList, exploitdb(SearchSploit), and more!

**Build and Run**
------------------
To build and run this container, follow these steps:

1. Clone the repository: `git clone https://github.com/hunterchasens/jupyterlab-kernels.git`
2. Build the Docker image: `docker build -t hunterchasens/jupyterlab-kernels .`
3. Run the container: `docker run -p 8888:8888 hunterchasens/jupyterlab-kernels`

**Roadmap**
------------------

* Add the most popular Kali headless tools including:
    + Metasploit
    + exploitdb (SearchSploit)
    + SecList
* Add a tools library
    + PEASS-ng (LinPEAS)
    + pentestmonkey/php-reverse-shell
* Add quality-of-life extensions
    + Graphing Extention to Graph Notes
    + Extention to allow linking between notebooks
* Add custom themes 
* Add showcase notebook
* Add default config


**License**
------------------
Please note that if a directory within this container has another license file, the contents of that file supersede any licenses mentioned in the repository. For example, /config/themes borrows its license from the Jupyterlab Project.

Note: This README.md is subject to change as the project evolves. Please check the repository for the latest updates.




