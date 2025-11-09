VENV_ACTIVATE = ${HOME}/.venv/bin/activate

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
