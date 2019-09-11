# base-trd-jupyter

Jupyter Notebooks for Base TRD

## Build the docs

Building the docs requires the python sphinx package. To install the package on
a Ubuntu machine run:
```
sudo apt-get install python3-sphinx
```
To generate the html docs run:
```
cd docs
make html
```
The output will be placed in the build folder.

## Update the html docs on github

The generated html pages are uploaded to the gh-pages branch on github. This
branch is used to display the html documentation at the following URL:
https://pages.gitenterprise.xilinx.com/PAEG/base-trd-jupyter/build/html/index.html

To update the docs, push a new branch with your changes. This assumes the docs
have been built/updated as shown in the previous step. It also assumes the
doc sources have been committed.
```
git checkout -b <user>/gh-pages origin/gh-pages
rsync -a --delete docs/build/ build/
git add build
git commit
git push origin <user>/gh-pages:<user>/gh-pages
```
Once pushed, open a new pull request and select the gh-pages branch as the
target branch.
