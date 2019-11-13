a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map do |phrase|
  phrase.split(" ")
end

a.flatten!

puts a