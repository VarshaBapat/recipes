require_relative 'controllers/recipes_controller.rb'

def dispatch(cmd, params = nil)
  case cmd
  when 'list'
    ::RecipesController.index
  when 'show'
    ::RecipesController.show params
  when 'new'
    ::RecipesController.new
  when 'edit'
    puts 'edit'
  when 'delete'
    ::RecipesController.destroy params
  end
end
