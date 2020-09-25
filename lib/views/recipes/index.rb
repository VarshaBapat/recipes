require 'tty-table'

module Views
  module Recipes
    def self.index(recipes:)
      recipes = recipes.map do |recipe|
        [recipe.id, recipe.title, recipe.difficulty]
      end

      if recipes.empty?
        puts 'No recipes!'
      else
        puts 'Recipes!'
        headers = %w[Id Title Difficulty]
        table = TTY::Table.new headers, recipes
        puts table.render :ascii
      end
    end
  end
end
