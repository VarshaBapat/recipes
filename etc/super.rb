class A
  def initialize
  end
end

class B < A
  def initialize(number)
    super()
  end
end

B.new(666)
