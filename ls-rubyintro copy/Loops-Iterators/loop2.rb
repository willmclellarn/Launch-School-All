stop = false
while stop == false
  puts "still going"
  puts "Want to stop now? Type STOP"
  text = gets.chomp
  if text == "STOP"
    stop = true
  end
end