require_relative '../models/recipe'
require_relative '../views/recipes/index'
require_relative '../views/recipes/show'
require_relative '../views/recipes/new'
require_relative '../views/recipes/edit'
require_relative '../views/recipes/destroy'

class RecipesController
  include Views::Recipes

  def index
    recipe = Recipe.all
    super recipes: recipe
  end

  def show(id)
    recipe = Recipe.find(id) rescue nil
    super recipe: recipe
  end

  def new
    recipe = Recipe.new
    super recipe: recipe
    recipe.save!
  rescue => e
    puts e
  ensure
    show recipe.id
  end

  def edit(id)
    recipe = Recipe.find(id)
    super recipe: recipe
  rescue => e
    puts e
  ensure
    show recipe.id
  end

  def destroy(id)
    recipe = Recipe.find(id) rescue nil
    return unless recipe

    recipe.delete
    super id: id
  end
end
