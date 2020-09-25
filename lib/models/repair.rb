require_relative 'assembly'

class Repair < Assembly
  attr_reader :qualification

  def initialize(title: nil, difficulty: nil, qualification: nil)
    super title: title, difficulty: difficulty
    @qualification = qualification
  end

  def valid_qualification?
    @qualification && !@qualification.empty?
  end

  def valid?
    super && valid_qualification?
  end

  def to_s
    [
      super,
      "Qualification:#{@qualification}"
    ].join("\n")
  end
end
