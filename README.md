glukoo.si
=========

Install this: https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.deb

```
git clone --recurse-submodules git@github.com:Glukoosi/glukoo.si.git
cd glukoo.si/site
hugo server
```

Publish:

```
hugo
cd public
gsutil rsync -R . gs://glukoo.si
```
