class Assembly
  # Since a constant is a global across the entire application, all subclasses
  # of assembly will use the same array. Consider refactoring this data
  # structure to an class instance variable.
  ASSEMBLIES = []

  attr_reader :id, :errors, :difficulty
  attr_accessor :title

  def initialize(title: nil, difficulty: nil)
    @id = nil
    @title = title
    @difficulty = difficulty.to_i
    @errors = {}
  end

  # We want to coelesce difficulty to always be an integer; use attr_reader
  # to be able to read difficulty, but write a custom setter method so that
  # we have control over the assignment to the @difficulty instance variable.
  def difficulty=(difficulty)
    @difficulty = difficulty.to_i
  end

  def valid?
    true
  end

  def save!
    raise 'RecordNotSaved' unless valid?

    @id = ASSEMBLIES.length + 1
    ASSEMBLIES << self
  end

  def update!
  end

  def delete
    idx = ASSEMBLIES.index { |assembly| assembly.id == @id }

    # Set the assembly to nil in the ASSEMBLIES array, effectively deleting
    # it. Also set @id to nil to flag that this assembly instance is no
    # longer persisted.
    @id = ASSEMBLIES[idx] = nil

    # Ids may be reused if we compact the array. Think up another way to
    # generate unique ids as well as be able to compact the array.
    # ASSEMBLIES.compact!
  end

  def to_s
    [
      super,
      "Id:#{@id} Title:#{@title} Difficulty:#{@difficulty}"
    ].join("\n")
  end

  # Encapsulate access to all assembles; but since we're leaking out the
  # array, it's possible that it gets mutated behind our back...
  def self.all
    ASSEMBLIES
  end

  def self.find(id)
    id = id.to_i
    assembly = ASSEMBLIES.find { |a| a.id == id }
    raise 'RecordNotFound' unless assembly

    assembly
  end
end
