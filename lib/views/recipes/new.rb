module Views
  module Recipes
    def self.new(recipe:)
      puts 'New Recipe!'
      begin
        print 'Title'
        print " (#{recipe.title})" unless recipe.title.nil?
        print ': '
        input = gets.chomp.strip
        recipe.title = !input.empty? ? input : recipe.title

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
