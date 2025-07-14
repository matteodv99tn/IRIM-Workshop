# Python variables
VENV = .venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip
ACTIVATE = . $(VENV)/bin/activate

.PHONY: docs clean venv view



docs: html

clean:
	@echo "Removing files"
	@rm html/ docs/generated docs/_autodoc -r 2>>/dev/null || true

venv: $(VENV)/bin/activate 

view: docs
	@xdg-open html/index.html 2>>/dev/null& disown|| open html/index.html 2>>/dev/null

html: $(VENV)/bin/activate
	$(ACTIVATE) && sphinx-build . html

# Create virtual environment
$(VENV)/bin/activate: requirements.txt
	@echo "Creating a new virtual environment..."
	@python3 -m venv $(VENV)
	@echo "Installing dependencies..."
	@$(PIP) install -r requirements.txt
	@touch $(VENV)/bin/activate
	@echo "Dependencies installed."
