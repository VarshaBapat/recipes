require_relative '_form'

module Views
  module Recipes
    def new(recipe:)
      puts 'New Recipe!'
      _form recipe
    end
  end
end
