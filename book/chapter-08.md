\newpage

# Concurrency and Channels

Did you remember Chapter 1? We did a concurrent Hello World!

Here's a quick reminder.

```ruby
channel = Channel(String).new
10.times do
  spawn {
    channel.send "Hello?"
  }
  puts channel.receive
end
```

In Crystal we use the keyword `spawn` to make something work in the background without blocking the main execution.

To achieve this `spawn` uses a lightweight thread called `Fiber`. `Fiber`s are very cheap to create and you can easily
create tens of thousands of `Fiber`s on a single core.

Okay, that's really cool! We can use `spawn` to make stuff work in the background but how do we get something back from a `Fiber`.

Now that's where `Channel`s come to play.

Channel
=======

As the name stands a `Channel` is a channel between a sender and the receiver. Therefore a `Channel` lets them communicate with `send` and `receive` methods.

Let's take a line by line look at our previous example.

```ruby
    channel = Channel(String).new
```

We create a `Channel` with `Channel(String).new`. Note that we are creating a `Channel` which will `send` and `receive` messages with type of `String`.

```ruby
10.times do
  spawn {
    channel.send "Hello?"
  }
  puts channel.receive
end
```

Leaving the loop aside, we are sending a message to our channel inside `spawn`.
You might ask 'Why are we sending message in the background?' Well, `send` is a blocking operation and if we do that in the main program we gonna block the program forever.

Consider this:

```ruby
channel = Channel(String).new
channel.send "Hello?" # This blocks the program execution
puts channel.receive
```

What's the output of this program? Actually this program won't ever finish because it gets blocked by `channel.send "Hello?"`.
Now that we know why we use `spawn` to send a message let's continue.

```ruby
spawn {
  channel.send "Hello?"
}
puts channel.receive
```

We just sent a message through our channel in the background with `spawn`. Then we receive it back with `channel.receive`. In this example the message is `Hello?` so this program prints `Hello?` and then finishes.
