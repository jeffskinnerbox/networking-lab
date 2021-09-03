#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.0.1
#


# ------------- install your python tools and libraries (as root) ------------

# python 3 development libraries including TK and GTK GUI support
apt-get -y install python3-dev python3-tk python-imaging-tk
apt-get -y install libgtk-3-dev libboost-all-dev
apt-get -y install python3-widgetsnbextension python3-testresources
apt-get -y install build-essential cmake
apt-get -y install python3-pip



# ------------ create your python working environment (as vagrant) -----------

# become the vagrant user and load profile
su --login vagrant --shell /bin/bash <<'EOF'

    # install virtual environment tools
    pip3 install virtualenvwrapper

    # setup environment for virtualenv and virtualenvwrapper
    mkdir ~/.virtualenvs

    # my bash shell doesn't load ~/.bashrc for non-interactive executions, do manually if you plan to use
    export PATH=$HOME/.local/bin:$PATH                                 # must also be in ~/.bashrc
    export WORKON_HOME=$HOME/.virtualenvs                              # must also be in ~/.bashrc
    export PROJECT_HOME=$HOME/Devel                                    # must also be in ~/.bashrc
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3                   # must also be in ~/.bashrc
    export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv    # must also be in ~/.bashrc
    source $HOME/.local/bin/virtualenvwrapper.sh                       # must also be in ~/.bashrc

    # install pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    # initialize pyenv environment if you plan to use
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc                # must also be in ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc             # must also be in ~/.bashrc

    # do pyenv intitalize
    $HOME/.pyenv/bin/pyenv install 3.8.5                # install python 3.8.5 (ubuntu 20.04 comes with 3.8.5)
    $HOME/.pyenv/bin/pyenv rehash                       # to assure the pyenv shims are updated

EOF

