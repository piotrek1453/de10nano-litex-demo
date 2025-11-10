# de10nano-litex-demo

Example SoC built with LiteX for Terasic DE10 Nano board

## General notes

This project and scripts contained in it assume LiteX is installed in a global
to user Python virtual environment with core repositories pulled to ~/.litex/
dir (other paths might work as well)

So LiteX was installed this way (assuming fish shell, similar for others)

```fish
# to make sure
cd $HOME
# create virtualenv...
python3 -m venv $HOME/.venv
# ...and activate it
. $HOME/.venv/bin/activate.fish
# cd into venv and make place for litex
cd .venv
mkdir litex/ && cd litex/
# download LiteX setup script
wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
# make it executable
chmod +x litex_setup.py
```

> [!IMPORTANT] make sure you're in a venv before running install, otherwise you
> might get errors with pip complaining about externally managed environment

```fish
# install LiteX, this'll take a while
./litex_setup.py --init --install --config=full
```

## Flashing firmware

Build project by calling in root of repo:

```fish
make build_litex_project
```

next open 2 terminals and on first trigger serial firmware upload by running:

```fish
make load_sw
```

and on second one upload the SoC:

```fish
make load_litex_project
```
