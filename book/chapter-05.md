\newpage

# Testing

Rubyists love testing, so before we go any farther, let's talk about
testing. In Crystal, there is a testing framework built in, and it's
named `spec`. It's pretty similar to `RSpec`.

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

Did you see that `spec` folder? Yes, as you guess Crystal created this folder and the first spec for us.
In Crystal a file is tested with corresponding `_spec` file. Since we named our project as `sample` it created a file named `sample.cr`
and the corresponding spec with `spec/sample_spec.cr`.

By the way, in this context `spec` and `unit test` means the same so we can use them interchangeably.

Without further ado lets open up `spec/sample_spec.cr`

```ruby
require "./spec_helper"

describe Sample do
  # TODO: Write tests

  it "works" do
    false.should eq(true)
  end
end
```

Now this file is pretty interesting. There a three important keywords, `describe`, `it` and `should`.

Those keywords are only used in `spec`s with the following purposes.

- `describe` lets you group related specs.
- `it` is used for defining a spec with the given title in between "".
- `should` is used for making assumptions about the spec.

As you can see this file has a group `describe`d as `Sample` and `it` has one spec with the title of `works` which makes the
assumption that false `should` equal true.

You might be asking 'How do we run these tests?'. Well `crystal` command to the rescue.

    $ crystal spec
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

Yay! We got a failing(red) test. Reading the output we can easily find which spec failed.
Here it's the spec within the group of `Sample` titled `works` a.k.a `Sample works`. Let's make it pass(green).

```ruby
require "./spec_helper"

describe Sample do
  # TODO: Write tests

  it "works" do
    true.should eq(true)
  end
end
```

Rerun the specs.

    $ crystal spec

    .

    Finished in 0.63 milliseconds
    1 examples, 0 failures, 0 errors, 0 pending

Green! That's all you need to know to get started. Next up: FizzBuzz.
