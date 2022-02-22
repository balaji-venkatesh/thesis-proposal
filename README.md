# A repo template for single-column proposals

Fork this repository when drafting a new proposal, if you like. On GitHub,
click the **Use this template** button. Follow the installation and compilation
instructions below. Read the generated
[`proposal_template.pdf`](./proposal_template.pdf) for a sample.

## Installation

The dependences include:
```
pdflatex, bibtex, rubber, make, ps2pdf, qpdf, pdftk
```

### Ubuntu 18.04
`pdftk`'s installation on 18.04
[is a nuisance](https://askubuntu.com/questions/1028522/how-can-i-install-pdftk-in-ubuntu-18-04-and-later).
Members of the mcj-group should add the following line to their `~/.bashrc` or
`~/.zshrc`:
```
export PATH=${PATH}:'/mnt/ceph/tools/pdftk/3.2.3'
```

### macOS

As of macOS 12.0.1, the following `brew` commands suffice to install the
dependences, apart from `rubber`. Given the nuisance of the `tlmgr` commands, I
now advise `brew install --cask mactex` instead of `basictex`.

```bash
brew install --cask basictex
brew install ghostscript
brew install qdf
brew install pdftk-java
sudo tlmgr update --self
sudo tlmgr install pdfcrop
sudo tlmgr install collection-latexextra
sudo tlmgr install inconsolata
sudo tlmgr install fourier
```

You may need to perform some surgery,
as [per this issue](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=930850#5):
```bash
sudo sed -i -e 's/&/:/' /usr/local/texlive/2021basic/texmf-dist/tex/latex/lstaddons/lstlinebgrd.sty
```
You will need to add the `basictex` `bin` path to your `PATH`.

Install `rubber` following the [instructions on GitLab](https://gitlab.com/latex-rubber/rubber/).


## Compilation

Once you install all dependences, you can build this proposal template with
```bash
make -j
```
