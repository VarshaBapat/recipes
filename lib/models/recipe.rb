require_relative 'assembly'

class Recipe < Assembly
  DIFFICULTY_RANGE = 1..5
  DIFFICULTY_ERROR_MESSAGE = \
    "Difficulty must be between #{DIFFICULTY_RANGE.first} and #{DIFFICULTY_RANGE.last}"

  # Override the default implmentation of `difficulty=` provided by Assembly
  # (the parent class). The default implementation is provided by Assembly.
  # For the Recipe class, we want to add a validation error for #difficulty
  # if it is out of range.
  def difficulty=(difficulty)
    super
    if valid_difficulty?
      errors.delete(:difficulty)
    else
      errors[:difficulty] = DIFFICULTY_ERROR_MESSAGE
    end
  end

  def valid_difficulty?
    DIFFICULTY_RANGE === @difficulty
  end

  def valid?
    super && valid_difficulty?
  end
end
