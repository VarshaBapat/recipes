require 'tty-table'

module Views
  module Recipes
    def self.index(recipes:)
      # We have to compact the recipes array since it could contain nils. The
      # array never gets compacted after a recipe is deleted. This shows how
      # bad things can get if the data structure is not correctly managed in
      # the model. Should the view really be doing a one-off compact??
      recipes = recipes.compact
      return puts 'No recipes!' if recipes.empty?

      headers = %w[Id Title Difficulty]
      rows = table_rows_for recipes
      table = TTY::Table.new headers, rows

      puts 'Recipes!'
      puts table.render :ascii
    end

    def self.table_rows_for(recipes)
      recipes.map do |recipe|
        [recipe.id, recipe.title, recipe.difficulty]
      end
    end
  end
end
