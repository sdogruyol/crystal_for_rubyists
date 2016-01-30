macro define_method(name, content)
  def {{name}}
    {{content}}
  end
end

define_method foo, 1
