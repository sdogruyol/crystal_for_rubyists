Why Crystal?
====================

You already write software in Ruby. It pays your bills. You enjoy it.
Why should you care about Crystal?

Let's think about Ruby for a minute: what's its biggest weakness? For
me, it's these things:

-   Concurrency
-   Speed
-   Documentation

What's awesome about Ruby?

-   Blocks
-   Vaguely functional
-   Syntax is pretty easy
-   Focus on developer happiness
-   Get up and running quickly
-   Dynamically typed

So we could learn a lot from a language that handles concurrency well,
and is fast and simple. We don't want to sacrifice anonymous functions, pretty syntax,
or not making `AbstractFactoryFactoryImpls` just to get work done.

I think that that language is Crystal.

Now: Crystal is not perfect, by far. It is getting better.
But the point is to *learn*. and using a language that's very familiar, yet very different, can teach us a lot.

Here's "Hello World" in Crystal:

~~~ {.ruby}
puts "Hello, world!"
~~~

Here's a parallel "Hello World" in Crystal:

~~~ {.ruby}
channel = Channel(String).new
10.times do
  spawn {
    channel.send "Hello?"
  }
  puts channel.receive
end
~~~

Here's a rough port to Ruby:


~~~ {.ruby}
10.times.map do
  Thread.new do
    puts "Hello?"
  end
end.each(&:join)
~~~

That's it. Note the stuff that's *similar* to Ruby:

-   Pretty same syntax.
-   Variables, while statically typed, have inference, so we don't need
    to declare types

Here's some stuff that's *different*:

-   The compiler will yell at us harder if we mess up.

Oh, and:

    $ time ./hello
    ./hello  0.00s user 0.00s system 73% cpu 0.008 total

    $ time ruby hello.rb
    ruby hello.rb  0.03s user 0.01s system 94% cpu 0.038 total

Five times faster. Yay irrelevant microbenchmarks!

Anyway, I hope you get my point: There's lots of things about Crystal that
make it syntactically vaguely similar enough to Ruby that you can feel
at home. And its strengths are some of Ruby's
greatest weaknesses. That's why I think you can learn a lot from playing
with Crystal, even if you don't do it as your day job.
