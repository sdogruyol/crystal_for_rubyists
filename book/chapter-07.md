\newpage

# Types and Method Overloading

Crystal is like Ruby, but it's not Ruby!

Unlike Ruby, Crystal is a statically typed and compiled language. Most of the time you don't have to specify
the types and the compiler is smart enough to do `type inference`.

So why do we need types? Let's start with something simple.

```ruby
def add(x, y)
  x + y
end

add 3, 5 # 8
```

This is the same in Ruby! We just defined a method that adds two numbers.
What if we try to add a number to a string?

```ruby
add 3, "Serdar"
```

First let's do that in Ruby.

```ruby
types.cr:2:in `+': String can't be coerced into Fixnum (TypeError)
	from types.cr:2:in `add'
	from types.cr:5:in `<main>'
```

What??? We just got a `TypeError` but we don't have to care about types in Ruby ( or not :)).
This is also a `runtime error` meaning that your program just crashed at runtime (definitely not good).

Now let's do the same in Crystal.

    Error in ./types.cr:5: instantiating 'add(Int32, String)'

    add 3, "Serdar"
    ^~~

    in ./types.cr:2: no overload matches 'Int32#+' with types String
    Overloads are:
    - Int32#+(other : Int8)
    - Int32#+(other : Int16)
    - Int32#+(other : Int32)
    - Int32#+(other : Int64)
    - Int32#+(other : UInt8)
    - Int32#+(other : UInt16)
    - Int32#+(other : UInt32)
    - Int32#+(other : UInt64)
    - Int32#+(other : Float32)
    - Int32#+(other : Float64)
    - Int32#+()

    x + y
      ^

Okay, that's quite a scary output but actually it's great. Our Crystal code didn't compile and also told us that there's no
overload for `Int32#+` and showed us the possible overloads. This is a `compile time error` meaning that our code didn't compile
and we catch the error before running the program. Lovely!

Now let's add some types and restrict that method to only accept `Number`s.

```ruby
def add(x : Number, y : Number)
  x + y
end

puts add 3, "Serdar"
```

Run it.

    Error in ./types.cr:5: no overload matches 'add' with types Int32, String
    Overloads are:
    - add(x : Number, y : Number)

    puts add 3, "Serdar"
         ^~~

Awesome! Our program didn't compile again. And this time with shorter and more accurate error output.
We just used `type restriction` on `x` and `y`. We restricted them to be `Number` and Crystal is smart
enough to stop us from using the method with a `String`.

## Method Overloading


We just saw a lot of overloads. Let's talk about `Method Overloading`.

Method overloading is having different methods with the same name and different number of arguments. They all have the same name but actually they are all different methods.

Let's overload our `add` method and make it work with a String.

```ruby
def add(x : Number, y : Number)
  x + y
end

def add(x: Number, y: String)
  x.to_s + y
end

puts add 3, 5

puts add 3, "Serdar"
```

Let's run it.

    $ crystal types.cr
    8
    3Serdar

Now, that's method overloading in action. It figured out that we are calling the method with a Number and String and called the appropriate method.
You can define as many overload methods as you wish.
