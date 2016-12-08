Project Diamond
===============

[![Build Staus][travis-status]][travis-project-diamond]
[![In Progress][waffle-inprogress]][waffle-project-diamond]

This is the hakyll source code that powers the website
<https://project-diamond.github.io>. While the `master` branch
contains the generated files, the actual source resides in the
`develop` branch.


## Building the website

The website uses the [Hakyll] static website generator. We recommend
using [stack] to build the site.

* [Install haskell stack]

* Fork [the repository on github][repo].

* Clone locally and work with the contents.

```bash

git clone git@github.com/your-user-name/project-diamond.github.io

cd project-diamond.github.io   # go to the root of the indian curry directory.

stack setup                 # set up stack
stack build website         # build hakyll executable
stack exec  website build   # should build the site
stack exec  website watch   # run preview server on localhost:8000
stack exec  website check   # check for broken links
git checkout -b topic       # Create a topic branch for developing.

```

* When done push your topic branch and send pull request.

```bash

git push origin -u topic # and send pull request from topic

```



## Editing the contents

Most of the time the only things that you want to edit is the contents
of this website.  You _do not_ need to know Haskell to edit the
contents. Please update the appropriate markdown file in this
repository and send us a pull request. The news items are available in
the directory `news`. The file names there needs to be in the format
`DD-MM-YYYY-Title-of-the-news-item.md`. If you want to add a news
item, it is best to just copy an existing news item and edit it.

However, if your aim is to change the way the site is built, then you
would need to know enough Haskell to edit `site.hs` file.


## Unconventional branch structure.

This repository has two branches the `master` and `develop`.  The
actual source for the website resides in the `develop` branch which is
the one you should be cloning and sending pull request to if you want
to hack on this website. The `master` branch merely has the raw
html/css/media files and serves as the github page for the site
<https://project-diamond.github.io>. So if by mistake your clone
contains the master branch, you can/should delete it. The deployment
of the website is done using the script [`scripts/deploy.sh`][deploy]
For more details on this work flow see the tutorial
<https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html>.


[indian curry]: <https://project-diamond.github.io> "Indian curry homepage"
[install haskell stack]: <https://docs.haskellstack.org/en/stable/README/> "Install haskell stack"
[stack]: <https://docs.haskellstack.org/en/stable/README/> "Haskell Stack"
[hakyll]: <https://jaspervdj.be/hakyll/> "Hakyll website generator"
[repo]: <https://github.com/project-diamond/project-diamond.github.io>

[waffle-project-diamond]:   <http://waffle.io/project-diamond/project-diamond.github.io>
[waffle-inprogress]: <https://badge.waffle.io/project-diamond/project-diamond.github.io.svg?label=waffle%3Ain%20progress&title=In%20Progress>
[travis-status]: <https://travis-ci.org/project-diamond/project-diamond.github.io.svg?branch=develop> "Build status"
[travis-project-diamond]: <https://travis-ci.org/project-diamond/project-diamond.github.io> "Build status"
[deploy]: <https://github.com/project-diamond/project-diamond.github.io/blob/develop/scripts/deploy.sh> "Deployment script"
