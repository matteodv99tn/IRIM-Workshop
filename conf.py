import os
import sys


newpath = os.path.abspath(os.path.join(__file__, '../..'))
print(newpath)
sys.path.insert(0, newpath)


project = "Industry 5.0: Workplace Transformation with Next Generation Smart Robots"
copyright = 'IDRA - 2025'
author = 'Matteo Dalle Vedove'
html_title = "Industry 5.0: Workplace Transformation with Next Generation Smart Robots"
# release = 'v0.0'

extensions = [
    "myst_parser",
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "sphinx.ext.napoleon",
]

source_suffix = ['.rst', '.md']

pygments_style = 'sphinx'

html_theme = 'furo'
autosummary_generate = True
