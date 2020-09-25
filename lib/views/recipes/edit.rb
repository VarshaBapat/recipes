require_relative '_form'

module Views
  module Recipes
    def edit(recipe:)
      puts "Edit #{recipe.id}"
      _form recipe
    end
  end
end
