\newpage

# Writing Your First Crystal Program


Okay! Let's get down to it: in order to call yourself an "X Programmer,"
you must write "Hello, world" in X. So let's do it. Open up a text file:
I'll use `vim` because I'm that kind of guy, but use whatever you want.
Crystal programs end in `.cr`:

    $ vim hello.cr

Put this in it:

```ruby
puts "Hello World!"
```

And run it with `crystal` command:

    $ crystal hello.cr
    Hello World!

It should run and print the output without error. If you get one, double check that you
have the double quotation marks. Errors look like this:

    $ crystal hello.cr
    Syntax error in ./hello.cr:1: unterminated char literal, use double quotes for strings

    puts 'Hello World!'

By the way `crystal` command is great for quickly running your code but it's slow. Each time it compiles and runs your program
Let's see how much does it takes to run that program.

    $ time crystal hello.cr
    crystal hello.cr  0.30s user 0.20s system 154% cpu 0.326 total

0.326 seconds for a `Hello World`? Now that's slow.

Instead of compiling and running again you can compile it to native code with the `build` command.

    $ crystal build hello.cr

And to run your program, do the Usual UNIX Thing:

    $ time ./hello
    ./hello  0.00s user 0.00s system 87% cpu 0.006 total

You should see "Hello, world." print to the screen 50x faster :) Congrats!
