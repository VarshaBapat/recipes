module Security
  SECURITY_ENABLED = true

  def security_enabled?
    SECURITY_ENABLED
  end

  def log(message)
    @logs ||= []
    @logs << message
  end

  def logs
    @logs
  end

  def self.klass_function
    "klass_function"
  end

  # module_function :klass_function
end

puts Security.klass_function

class Assembly
  attr_accessor :title
  # def title; @title; end
  # def title=(title); @title = title; end
end

class Recipe < Assembly
end

class Repair < Assembly
  include Security

  def title=(new_title)
    old_value = @title
    super
    log("Title updated old:#{old_value} new:#{@title}")
  end
end

recipe = Recipe.new
recipe.title = 'Recipe'
p recipe

repair = Repair.new
repair.title = 'Repair'
repair.title = 'No Repair'
repair.log 'Log message'
puts repair.logs
p repair
puts repair.security_enabled?
