# Python variables
VENV = .venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip
ACTIVATE = . $(VENV)/bin/activate

TEX_FILES = $(shell find . -name '*.tex')
DOC_FILES = $(shell find . -name '*.md') $(TEX_FILES) _static/css/style.css

.PHONY: docs pdf clean venv view



docs: html

clean:
	@echo "Removing files"
	@rm html/ -r main.aux main.fdb_latexmk main.fls main.log main.out 2>>/dev/null || true

pdf: main.pdf

venv: $(VENV)/bin/activate 


view: docs
	@xdg-open html/index.html 2>>/dev/null& disown|| open html/index.html 2>>/dev/null

html: $(VENV)/bin/activate conf.py index.rst $(DOC_FILES)
	$(ACTIVATE) && sphinx-build . html

main.pdf: main.tex
	@echo "Compiling pdf"
	@pdflatex -interaction=nonstopmode main.tex -o main.pdf


# Create virtual environment
$(VENV)/bin/activate: requirements.txt
	@echo "Creating a new virtual environment..."
	@python3 -m venv $(VENV)
	@echo "Installing dependencies..."
	@$(PIP) install -r requirements.txt
	@touch $(VENV)/bin/activate
	@echo "Dependencies installed."
