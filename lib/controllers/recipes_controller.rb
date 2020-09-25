require_relative '../models/recipe'
require_relative '../views/recipes/index'
require_relative '../views/recipes/show'
require_relative '../views/recipes/new'
require_relative '../views/recipes/edit'

module RecipesController
  def index
    recipe = Recipe.all
    ::Views::Recipes.index recipes: recipe
  end

  def show(id)
    recipe = Recipe.find(id) rescue nil
    ::Views::Recipes.show recipe: recipe
  end

  def new
    recipe = Recipe.new
    ::Views::Recipes.new recipe: recipe
    recipe.save!
    show recipe.id
  rescue => e
    puts e
  end

  def edit(id)
    recipe = Recipe.find(id)
    ::Views::Recipes.new recipe: recipe
  rescue => e
    puts e
  end

  def destroy(id)
    recipe = Recipe.find(id) rescue nil
    return unless recipe

    recipe.delete
  end

  module_function :index, :show, :new, :destroy, :edit
end
