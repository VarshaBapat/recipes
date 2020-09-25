require_relative '_form'

module Views
  module Recipes
    def self.edit(recipe:)
      puts "Edit #{recipe.id}"
      _form recipe
    end
  end
end
