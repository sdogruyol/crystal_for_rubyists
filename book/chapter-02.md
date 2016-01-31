\newpage

# Installing Crystal


Binary installers
-----------------

The Crystal project provides official binary installers. You can get both releases
and nightlies. Binary installers are the fastest and easiest way to get going
with Crystal. Because Crystal is written in Crystal, compiling the Crystal compiler actually
entails compiling it three times! This means it's quite slow. But a binary install
should be snappy!

Crystal has a [lovely installation page](http://crystal-lang.org/docs/installation/index.html),
so I recommend you just go check that out and download the proper version.

Note that this book has been tested with Crystal 0.10.0, and so if you use the latest
nightly, something may have changed.

From Source
-----------

You will probably build the nightly version if you build from source, so
be ready for some bugs in the code samples. This book was written for 0.10.0.

The [Crystal README](http://crystal-lang.org/docs/installation/from_source_repository.html)
has great instructions for building form source. Just got follow their
instructions!

### Future Proofing

The version this book is written for is 0.10.0. While the language itself is
pretty stable, things like the standard library and some major subsystems are
being revised. I'll be tweaking it with every new release.

If you run

    $ crystal

and it spits out a bunch of help information, you're good to go with
Crystal.
