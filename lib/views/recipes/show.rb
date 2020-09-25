module Views
  module Recipes
    def show(recipe:)
      return puts 'Recipe not found' unless recipe

      headers = %w[Attribute Value]
      attrs = attribute_rows_for recipe
      table = TTY::Table.new headers, attrs

      puts table.render :ascii
    end

    def attribute_rows_for(recipe)
      rows = []
      rows << ['Id', recipe.id]
      rows << ['Title', recipe.title]
      rows << ['Difficulty', recipe.difficulty]
    end
  end
end
