module Views
    module Recipes
        def show recipe:
            puts recipe
        end

        module_function :show
    end
end