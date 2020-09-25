class Assembly
  ASSEMBLIES = []

  attr_reader :id, :errors, :difficulty
  attr_accessor :title

  def initialize(title: nil, difficulty: nil)
    @id = nil
    @title = title
    @difficulty = difficulty.to_i
    @errors = {}
  end

  def difficulty=(difficulty)
    @difficulty = difficulty.to_i
  end

  def valid?
    true
  end

  def save!
    raise "RecordNotSaved: #{errors.values}" unless valid?

    @id = ASSEMBLIES.length + 1
    ASSEMBLIES << self
  end

  def delete
    idx = ASSEMBLIES.index { |assembly| assembly[:id] == @id }
    @id = ASSEMBLIES[idx] = nil
    # TODO: Ids may be reused if we compact the array. Think up another way
    # to generate ids that will always be unique.
    # ASSEMBLIES.compact!
  end

  def to_s
    [
      super,
      "Id:#{@id} Title:#{@title} Difficulty:#{@difficulty}"
    ].join("\n")
  end

  def self.all
    ASSEMBLIES
  end

  def self.find(id)
    id = id.to_i
    ASSEMBLIES.find { |assembly| assembly[:id] == id }
  end
end
