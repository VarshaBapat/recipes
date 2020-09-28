# # File.read('recipes.txt')
# begin
#     x = 1/0 rescue [0, nil]
#     puts "does this code execute?"
#     raise "Big Fat Error"
# rescue ZeroDivisionError => e
#     puts e.class
#     puts e.message
# rescue RuntimeError => e
#     puts "oh no!"
# end

def m1
    1/0
end

def m2
    m1()
rescue
    "you're out of luck"
end

puts m2()