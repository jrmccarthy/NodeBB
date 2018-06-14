## TMD Readme

# How to build a TMD-ish Nodebb server and run it from here

There's a new dockerfile that is specifically for running a TMD version of Nodebb.

This assumes you have:

* A running mongo server
* All the various nodebb stuff created in mongo (users, database)
* You know the address, username, secret etc. for your Mongo instance

# Building the Image

First, you'll want to build the image. This is easy!

```docker build -f web.Dockerfile -t tmd-web .```

This builds an image with the tag "tmd-web", that you can run locally. Note this doesn't
do anything fancy like mount your code in for local dev; that will come later. So, whenever
you change anything, you have to rebuild the image.

# Running the image

First, figure out the info for your mongo server. You'll need to pass all this stuff in
as ENV variables, unless you use the defaults I've set up. To run it:

```docker run -it -p 4567:4567 --link mongodb:mongodb tmd-web```

* `-p` is the Port. By default, Nodebb uses 4567 so we use that too.
* `--link` is the name of the mongo container that you're running. If you're running a real Mongo instance somewhere, you don't need this. If mongo is running on your localhost, TBA I'll figure out/remember this later. Or you can figure it out yourself!
* If you are using different info than my default mongo stuff (you can see it in `web.Dockerfile`), you'll need to pass in the right info as variables. You can do this with additional args BEFORE `tmd-web` in the form of `-e mongo__database="whatever you want"` etc. You can have as many `-e` args as you want.

That should be it. From there, give it a minute to do all the setup required, create templates, install plugins, etc. Once the webserer is up and running, visit `http://127.0.0.1:4567/` and hopefully you'll have a running nodebb server! You can do all the stuff from there. Hooray!
