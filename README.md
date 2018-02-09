# makefiles
learning about makefiles using go

Sort of stolen from http://mrbook.org/blog/tutorials/make/

# In this repo:
there are two makefiles in this repository

## non-docker
the default makefile (`./makefile`) will be used if no `-f` flag is given to `make`.

decent for local development but depend on the version of go the user is using

## docker-ish
the `docker.makefile` leverages docker to do all of the heavy lifting.

if you don't want to care what version of go, dep, etc are installed on the machine of the `make`-er you
can use docker for things like this super easily.

### todo
There are ways to share some commands (`clean` and `vendor_clean` are prime candidates) and variables but I
haven't made an effort towards that yet. 
