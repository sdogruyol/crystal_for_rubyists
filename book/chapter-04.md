Creating a new project
======================

Up until now we've used the `crystal` command to only run our code.

Actually `crystal` command is pretty useful and does lot more than that. (check `crystal --help` for more)

For example we can use it to create a new Crystal project.

    $ crystal init app sample
      create  sample/.gitignore
      create  sample/LICENSE
      create  sample/README.md
      create  sample/.travis.yml
      create  sample/shard.yml
      create  sample/src/sample.cr
      create  sample/src/sample/version.cr
      create  sample/spec/spec_helper.cr
      create  sample/spec/sample_spec.cr
Initialized empty Git repository in
/Users/serdar/crystal_for_rubyists/code/04/sample/.git/

Awesome. `crystal` helped us create a new project. Let's see what it did for us.

  - Created a new folder named sample
  - Created a LICENSE
  - Created `.travis.yml` to easily integrate Travis for continous integration.
  - Created `shard.yml` for dependency management.
  - Initialized an empty Git repository
  - Created a README for our project
  - Created `src` and `spec` folders to put our code and tests(ssh..we'll talk about it soon) in it.

Let's run it.

    $ cd sample
    $ crystal src/sample.cr

Nothing! Yay :)

Now that we create our first project. Let's use some libraries.

To add a new dependency to our project we use `shards`. `shards` is like `bundler` and `shard.yml` is like `Gemfile`.

Let's open up `shard.yml`.

~~~ {.yaml}
    name: sample
    version: 0.1.0

    authors:
      - sdogruyol <dogruyolserdar@gmail.com>

    license: MIT
~~~

This is a default `shard.yml` now let's add [Kemal](https://github.com/sdogruyol/kemal) and build a web app :)

~~~ {.yaml}
    dependencies:
      kemal:
        github: sdogruyol/kemal
        branch: master
~~~

Install the dependencies:

    $ shards install
    Updating https://github.com/sdogruyol/kemal.git
    Installing kemal (master)

Okay now we can use `Kemal` in our project. Open up `src/sample.cr`

~~~ {.ruby}
require "./sample/*"
require "kemal"

module Sample

  get "/" do
    "Hello World!"
  end

end
~~~

Let's run.

    $ crystal src/sample.cr
    [development] Kemal is ready to lead at http://0.0.0.0:3000

Go to `localhost:3000` and see it in action!

Now you know how to add dependencies and use others' `shard`s :)
