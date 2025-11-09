VENV_ACTIVATE = .venv/bin/activate

setup_venv:
	python -m venv --prompt litex_2025 .venv/ && \
	. $(VENV_ACTIVATE) && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

build_litex_project:
	@echo "Checking virtualenv..."
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Activating venv..."; \
		. $(VENV_ACTIVATE); \
	else \
		echo "Using already active venv"; \
	fi; \
	python3 litex_soc.py --build

load_litex_project:
	@echo "Checking virtualenv..."
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Activating venv..."; \
		. $(VENV_ACTIVATE); \
	else \
		echo "Using already active venv"; \
	fi; \
	python3 litex_soc.py --load
