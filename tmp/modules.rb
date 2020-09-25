module App
  module F1
    def new
      puts 'f1 new'
      F2.new
    end

    module_function :new
  end
end

# Possiblly in another file...
module App
  module F2
    def new
      puts 'f2 new'
    end

    module_function :new
  end
end

::F1.new
