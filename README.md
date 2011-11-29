Description
===========
A sinatra web shell using [ripl](http://github.com/cldwalker/ripl) that deploys on Heroku.

Usage
=====

    # I know, I'm the only one that uses it
    $ rip install git://github.com/cldwalker/websh.git

    # If you want it as a gem, ping me


    # Start shell in background
    $ websh &
    # Open in browser
    $ open http://localhost:9292/

To run on heroku cedar:

    $ git clone git://github.com/cldwalker/websh.git
    $ heroku create -s cedar mywebsh
    $ git push heroku master
    $ heroku open

About
=====

This shell is mostly a sinatra version of [nirvana](http://github.com/cldwalker/nirvana). Thus it
has the same features: supports multi-line input, has autocompletion and other ripl
goodies.

Although this project mostly works, it could use some polish. Pull request away!
