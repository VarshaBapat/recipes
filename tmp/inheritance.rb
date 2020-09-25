require_relative '../models/recipe'
require_relative '../models/repair'

puts '-- Recipe'
p Recipe.ancestors
recipe = Recipe.new
puts recipe.to_s

puts '-- Repair'
p Repair.ancestors
repair = Repair.new qualification: 'Mechanic Class A'
puts repair.to_s