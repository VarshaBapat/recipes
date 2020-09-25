require_relative 'assembly'

class Recipe < Assembly
  DIFFICULTY_RANGE = 1..5
  DIFFICULTY_ERROR_MESSAGE = \
    "Difficulty must be between #{DIFFICULTY_RANGE.first} and #{DIFFICULTY_RANGE.last}"

  # Override the default implmentation of `difficulty=` provided by Assembly (the parent
  # class). The default implementation is provided by attr_accessor in Assembly. For
  # the Recipe class, we want to ensure that #difficulty is always an integer so that
  # we can then do a range validation (`DIFFICULTY_RANGE`).
  def difficulty=(difficulty)
    super
    if valid_difficulty?
      errors.delete(:difficulty)
    else
      errors[:difficulty] = DIFFICULTY_ERROR_MESSAGE
    end
  end

  def valid_difficulty?
    DIFFICULTY_RANGE.member? @difficulty
  end

  def valid?
    super && valid_difficulty?
  end
end
