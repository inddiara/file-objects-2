require 'json'

class Recipe
  attr_reader :title, :description, :ingredients, :cook_time, :featured

  def initialize(title:, description:, ingredients:, cook_time:,
                 featured: false)
    @title = title
    @description = description
    @ingredients = ingredients
    @cook_time = cook_time
    @featured = featured
  end

  def self.from_json(json_file)
    attributes = JSON.parse(File.read(json_file))
    Recipe.new(title: attributes['title'],
               description: attributes['description'],
               ingredients: attributes['ingredients'],
               cook_time: attributes['cook_time'],
               featured: attributes['featured'])
  end

  def self.to_json
    { 'Recipe' => self.class.recipe, 'data' => [title, description, ingredients, cook_time, featured]}.to_json(*a)
  end

  # def self.save_to_file
  #   File.write('data/recipe.json', 'w') do |f|
  #     f.puts(recipe.to_json)
  #   end
  # end

end
