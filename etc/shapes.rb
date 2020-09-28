class Shape
  @number_of_sides = 0
  @@number_of_sides = 0

  def self.__number_of_sides
    @@number_of_sides
  end

  def self.number_of_sides
    @number_of_sides
  end
end

class Rectange < Shape
  @@number_of_sides = 4
  @number_of_sides = 4
end

class Triangle < Shape
  @@number_of_sides = 3
  @number_of_sides = 3
end

[ :number_of_sides, :__number_of_sides ].each do |method_name|
  puts method_name
  puts "Shape=#{Shape.send method_name}"
  puts "Triange=#{Triangle.send method_name}"
  puts "Rectange=#{Rectange.send method_name}"
  puts '-- ' * 5
end
