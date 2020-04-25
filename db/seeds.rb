require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# INGREDIENTS
puts "Destroying old ingredients"
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_array = JSON.parse(ingredients_serialized)
ingredients = ingredients_array.first[1]

drink_ingredients = ingredients.map do |ingredient|
  ingredient.values
end

drink_ingredients.flatten.each do |ingredient|
  Ingredient.create(name: ingredient)
  puts "Created #{ingredient}"
end

puts "Created all ingredients"

# COQUETEIS
Cocktail.create(name: "Bloody Mary")
Cocktail.create(name: "Moscow Mule")
Cocktail.create(name: "Caipirinha")

#DOSES
Dose.create!(description: "1 leave", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create!(description: "1 cup", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
Dose.create!(description: "2 tablespoons", cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
