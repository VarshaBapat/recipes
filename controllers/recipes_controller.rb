require_relative '../models/recipe'
require_relative '../views/recipes/index'
require_relative '../views/recipes/show'
require_relative '../views/recipes/new'

module RecipesController
    def index
        r = Recipe.all
        ::Views::Recipes::index recipes: r
    end

    def show(id)
        recipe = Recipe.find(id)
        ::Views::Recipes::show recipe: recipe
    end

    def new
        recipe = Recipe.new
        ::Views::Recipes.new recipe: recipe
        Recipe::create(recipe)
    end

    def destroy(id)
        Recipe::delete(id)
    end
    
    module_function :index, :show, :new, :destroy
end