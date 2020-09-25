class Base
  COLLECTION = ['COLLECTION']
  @@collection = ['@@collection']

  puts "Base::self=#{self}"
  @collection = ['Base']

  def self.collection
    @collection
  end

  def self.__collection
    @@collection
  end

  def self.who_am_i?
    self
  end
end

class K1 < Base
  @collection = ['K1']
  puts "K1::self=#{self}"
end

class K2 < Base
  @collection = ['K2']
  puts "K2::self=#{self}"
end

puts '-- ' * 5

print 'Base.who_am_i?='
puts Base.who_am_i?

print 'K1.who_am_i?='
puts K1.who_am_i?

print 'K2.who_am_i?='
puts K2.who_am_i?

puts '-- ' * 5

puts "Base.collection=#{Base.collection}"
puts "K1.collection=#{K1.collection}"
puts "K2.collection=#{K2.collection}"

puts '-- ' * 5

# The #equal? method tests if two operands refer to the same object:

print 'Are Base.collection and K1.collection the same object? '
puts Base.collection.equal? K1.collection

print 'Are K1.collection and K2.collection the same object? '
puts K1.collection.equal? K2.collection

print 'Are Base.collection and K2.collection the same object? '
puts Base.collection.equal? K2.collection

puts '-- ' * 5

print 'Are Base::COLLECTION and K1::COLLECTION the same object? '
puts Base::COLLECTION.equal? K1::COLLECTION

print 'Are K1::COLLECTION and K2::COLLECTION the same object? '
puts K1::COLLECTION.equal? K2::COLLECTION

puts '-- ' * 5

print 'Are Base::@@collection and K1::@@collection the same object? '
print Base.__collection.equal? K1.__collection
puts Base.class_variable_get(:@@collection).equal? K1.class_variable_get(:@@collection)

print 'Are K1::COLLECTION and K2::COLLECTION the same object? '
print K1.__collection.equal? K2.__collection
puts K1.class_variable_get(:@@collection).equal? K2.class_variable_get(:@@collection)
