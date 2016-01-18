Testing
=======

Rubyists love testing, so before we go any farther, let's talk about
testing. In Crystal, there is a testing framework built in, and it's
pretty similar to `RSpec`.

Let's continue with the project we created in Chapter 04.

As you remember `crystal` created this project structure for us.

    $ cd sample && tree
    -- LICENSE
    -- README.md
    -- shard.yml
    -- spec
      -- sample_spec.cr
      -- spec_helper.cr
    -- src
      -- sample
        -- version.cr
      -- sample.cr

Did you see that `spec` folder? Yes, as you guess Crystal created the folder and first specs for us.
In Crystal a `class` is tested with corresponding `_spec` file. In this case `spec/sample_spec.cr`.

Let's see what's inside. Open up `spec/sample_spec.cr`


~~~ {.ruby}
require "./spec_helper"

describe Sample do
  # TODO: Write tests

  it "works" do
    false.should eq(true)
  end
end
~~~

As you see it created a `spec` for us which actually test nothing.
Let's run the tests.

    $ crystal spec
    crystal spec
    F

    Failures:

      1) Sample works
         Failure/Error: false.should eq(true)

           expected: true
                got: false

         # ./spec/sample_spec.cr:7

    Finished in 0.69 milliseconds
    1 examples, 1 failures, 0 errors, 0 pending

    Failed examples:

    crystal spec ./spec/sample_spec.cr:6 # Sample works


Yay! We got a failing(red) test. Now let's make it pass(green).

~~~ {.ruby}
require "./spec_helper"

describe Sample do
  # TODO: Write tests

  it "works" do
    true.should eq(true)
  end
end
~~~

Rerun the specs.

    $ crystal spec

    .

    Finished in 0.63 milliseconds
    1 examples, 0 failures, 0 errors, 0 pending

Green! That's all you need to know to get started. Next up: FizzBuzz.
