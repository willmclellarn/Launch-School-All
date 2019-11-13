movies = {:spiderman => 2003,
	:black_panther => 2018,
	:pink_panther => 1971
}

date_array = []

movies.each do |x,y|
	date_array.push(movies[x])
end
puts date_array

# puts movies[:spiderman]
# puts movies[:black_panther]
# puts movies[:pink_panther]

