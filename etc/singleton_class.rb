class Vehicle
  @wheels = 0
  @@wheels = 0
  @@count = 0

  def self.wheels
    @wheels
  end

  def self._wheels
    @@wheels
  end

  def self.count
    @@count
  end

  def initialize
    @@count += 1
  end

  def description; end

  def self.register(vin)
  end
end

class Car < Vehicle
  @wheels = 4
  @@wheels = 4

  def initialize(colour = 'white')
    @colour = colour
  end

  attr_reader :colour

  def color
    @colour
  end

  def self.register(vin)
    super
  end
end

Motorbike = Class.new(Vehicle) do
  @wheels = 2
  @@wheels = 2

  def self.register(vin)
    super
  end
end

# class Motorbike < Vehicle
#   @wheels = 2
#   @@wheels = 2
#
#   def self.register(vin)
#     super
#   end
# end

puts Vehicle.wheels
puts Car.wheels
puts Motorbike.wheels

puts Vehicle._wheels
puts Car._wheels
puts Motorbike._wheels

Car.new; Car.new; Car.new; Motorbike.new
puts Vehicle.count
