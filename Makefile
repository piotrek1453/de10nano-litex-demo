VENV_DEV = .venv/bin/activate
VENV_BUILD = $(HOME)/.venv/bin/activate

setup_venv:
	python -m venv --prompt litex_2025 .venv/ && \
	. $(VENV_DEV) && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

generate_compile_commands:
	cd firmware && bear --output compile_commands.json --  make

soc_help:
	. $(VENV_BUILD); \
	python3 litex_soc.py --help

build_litex_project:
	. $(VENV_BUILD); \
	python3 litex_soc.py --build --integrated-main-ram-size 0x8000

load_litex_project:
	. $(VENV_BUILD); \
	python3 litex_soc.py --load

bare_metal_demo:
	. $(VENV_BUILD); \
	litex_bare_metal_demo --build-path build/sipeed_tang_nano_9k --mem main_ram --with-cxx 
