10.times.map do
  Thread.new do
    puts "Hello?"
  end
end.each(&:join)
