filename = File.join(File.dirname(__FILE__), 'empty.txt')
puts filename
puts "Exists? #{File.exists? filename}"
puts "Is empty? #{File.empty?(filename)}"
