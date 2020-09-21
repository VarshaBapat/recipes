require 'terminal-table'

module Views
    module Recipes
        def index(recipes:)
            puts 'Recipes!'
            recipes = recipes.map { |recipe| recipe.values }
            table = Terminal::Table.new \
                :rows => recipes,
                :headings => ['Id', 'Title', 'Difficulty']
            puts table
        end

        module_function :index
    end
end