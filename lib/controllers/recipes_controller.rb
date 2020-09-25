require_relative '../models/recipe'
require_relative '../views/recipes/index'
require_relative '../views/recipes/show'
require_relative '../views/recipes/new'

module RecipesController
  def index
    recipe = Recipe.all
    ::Views::Recipes.index recipes: recipe
  end

  def show(id)
    recipe = Recipe.find(id)
    ::Views::Recipes.show recipe: recipe
  end

  def new
    recipe = Recipe.new
    ::Views::Recipes.new recipe: recipe
    recipe.save!
  rescue => e
    puts e
  end

  def destroy(id)
    Recipe.delete(id)
  end

  module_function :index, :show, :new, :destroy
end
