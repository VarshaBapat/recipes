module Views
    module Recipes
        def new recipe:
            puts "New Recipe!"
            print "Title: "
            recipe[:title] = gets.chomp.strip
            print "Level of Difficulty (1-5): "
            recipe[:difficulty] = gets.chomp.strip.to_i
        end

        module_function :new
    end
end
