\newpage

# Writing Your First Crystal Program


Okay! Let's get down to it: in order to call yourself an "X Programmer,"
you must write "Hello, world" in X. So let's do it. Open up a text file:
I'll use `vim` because I'm that kind of guy, but use whatever you want.
Crystal programs end in `.cr`:

    $ vim hello.cr

Put this in it:

```ruby
puts "Hello, world."
```

And compile it with `crystal`:

    $ crystal hello.cr

It should compile without error. If you get one, double check that you
have the double quotation marks. Errors look like
this:

    $ crystal hello.cr
    Syntax error in ./hello.cr:1: unterminated char literal, use double quotes for strings

    puts 'Hello World!'

To run your program, do the Usual UNIX Thing:

    $ ./hello

And you should see "Hello, world." print to the screen. Congrats!
