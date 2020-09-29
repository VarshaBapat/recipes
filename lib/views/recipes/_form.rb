module Views
  module Recipes
    def self._form(recipe)
      begin
        print 'Title'
        print " (#{recipe.title})" unless recipe.title.nil?
        print ': '
        input = gets.chomp.strip
        # recipe.title = !input.empty? ? input : recipe.title
        recipe.title = input.empty? ? recipe.title : input

        print 'Level of Difficulty (1-5)'
        print " (#{recipe.difficulty})" unless recipe.difficulty.nil?
        print ': '
        input = gets.chomp.strip
        recipe.difficulty = !input.empty? ? input : recipe.difficulty

        puts recipe.errors.values unless recipe.valid?
      end until recipe.valid?
    end
  end
end
