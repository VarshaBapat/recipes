module App
    module F1
        def new
            puts "f1 new"
            F2.new
        end

        module_function :new
    end
end