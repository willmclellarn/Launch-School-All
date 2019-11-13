# flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# new_flintstones = []

# flintstones.each do |item|
#   if item.class != Array
#     new_flintstones << item
#   else item.each do |name|
#     new_flintstones << name
#     end
#   end
# end

# print new_flintstones

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.to_a[2]

print flintstones