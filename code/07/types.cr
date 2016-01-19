def add(x : Number, y : Number)
  x + y
end

def add(x : Number, y : String)
  x.to_s + y
end

puts add 3, 5 # 8

puts add 5, "Serdar"
