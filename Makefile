VENV_DEV = .venv/bin/activate
VENV_BUILD = $(HOME)/.venv/bin/activate

setup_venv:
	python -m venv --prompt litex_2025 .venv/ && \
	. $(VENV_DEV) && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

build_litex_project:
	. $(VENV_BUILD); \
	python3 litex_soc.py --build

load_litex_project:
	. $(VENV_BUILD); \
	python3 litex_soc.py --load
