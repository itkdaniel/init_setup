#!/bin/bash
sudo apt update
#sudo apt upgrade
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install -y
sudo apt install python3.9 -y
sudo apt install python3.9-distutils -y
sudo apt install python3.9-venv -y
curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.9 get-pip.py
sudo apt install python3-pip -y
#sudo ln -sf /usr/bin/python3.9 /usr/bin/python3
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
#sudo update-alternatives --config python3
python3.9 --version
pip3 --version
