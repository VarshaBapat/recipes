module App
    module F2
        def new
            puts "f2 new"
        end

        module_function :new
    end
end