\newpage

# C Bindings

There are lots of useful C libraries out there. It's important that we make use of
them instead of rewriting every single of them.

In Crystal, It's super easy to use existing C libraries with bindings. Even Crystal itself
uses C libraries.

For example Crystal uses `libpcre` for it's `Regex` implementation.

Like I said it's super easy to write bindings for C. Crystal itself links to `libpcre` like this

```ruby
@[Link("pcre")]
lib LibPCRE
...
end
```

With just 3 lines of code you we're linked to `libpcre` :) We use `lib` keyword to group functions and types
that belong to a library. And it's a good convetion to start with `Lib` for your C library declarations.

Next we bind to C functions with the `fun` keyword.

```ruby
@[Link("pcre")]
lib LibPCRE
  type Pcre = Void*
  fun compile = pcre_compile(pattern : UInt8*, options : Int, errptr : UInt8**, erroffset : Int*, tableptr : Void*) : Pcre
end
```

Here we binded to `libpcre`s compile function with the matching types. Now we can easily access this function in our Crystal code.

```crystal
LibPCRE.compile(..)
```
