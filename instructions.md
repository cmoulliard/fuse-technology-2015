# Generate the Slideshow

    hyla generate -c slideshow/conference-redhat.yaml
    hyla generate -c slideshow/conference-softshake-2015.yaml
    hyla generate -c demo/conference-redhat.yaml
    
# Change Style
    
* Copy sass folder out of revealjs-redhat directory to the generated folder
* Edit the conference-scss file and generate the css as such

```
compass compile --fonts-dir 'fonts' --css-dir 'slideshow/generated/revealjs-redhat/lib/css' --sass-dir 'slideshow/generated/sass' -e development --output-style=expanded --force
```    

# Move content to Github io

Instructions to add manually pages : https://help.github.com/articles/creating-project-pages-manually/

Home page of the content : http://cmoulliard.github.io/emea-partners-2015/slideshow/generated/

## Create tar file of the HTML files generated 

    ./generate_tar.sh
    
## Create gh-pages branch (one time)

    git checkout --orphan gh-pages
    git rm -rf slideshow 
    git rm .gitignore
    rm -rf slideshow  
    
## Add content  - first time

    ./import_site.sh
    git add slideshow
    git commit -m "Update web content" -a
    
## Add content - next time 

Use script `/import_commit.sh` which contain the following instructions

```
#!/usr/bin/env bash

file=emea-partners
echo "Create Tar file"
tar zcvf $TMPDIR/$file.tar.gz slideshow/generated

echo "Checkout to gh-pages"
git checkout gh-pages
rm -rf slideshow

tar zxvf $TMPDIR/$file.tar.gz slideshow/generated

git commit -m "Update web content" -a
git push
git checkout master
```    
    