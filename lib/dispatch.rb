require_relative 'controllers/recipes_controller.rb'

def dispatch(cmd, params = nil)
  controller = RecipesController.new

  case cmd
  when 'list'
    controller.index
  when 'show'
    controller.show params
  when 'new'
    controller.new
  when 'edit'
    controller.edit params
  when 'delete'
    controller.destroy params
  end
end
