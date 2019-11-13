# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

close_fam = family.select {|key, value|
  key == :sisters || key == :brothers
}
puts close_fam

my_array = close_fam.values.flatten
puts my_array