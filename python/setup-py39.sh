#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install -y
sudo apt install python3.9
sudo python3.9-distutils
sudo python3.9-venv
curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.9 get-pip.py
python3.9 --version
pip3 --version
