\newpage

# Macros and Metaprogramming

We love Ruby because of its' dynamic nature and metaprogramming! Unlike Ruby, Crystal is a compiled language.
That's why there are some key differences.

- There's no `eval`.
- There's no `send`.

In Crystal we use `Macro`s to achieve this kind of behaviour and metaprogramming. You can think of `Macro`s as 'Code that writes/modifies code'.

P.S: `Macro`s are expanded into code at compile-time.

Check this.

```ruby
macro define_method(name, content)
  def {{name}}
    {{content}}
  end
end

define_method foo, 1
# This generates:
#
#     def foo
#       1
#     end

foo # => 1
```

In the example we created a macro named `define_method` and we just called that macro like a normal method. That macro expanded into

```ruby
  def foo
    1
  end
```

Pretty cool! We got `eval` behaviour at compile-time.

Macros are really powerful but there's one rule that you can't break.

***A macro should expand into a valid Crystal program***
