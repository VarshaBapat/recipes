module Recipe
    RECIPES = [
        { id: 1, title: 'Choclate Cake', difficulty: 3 },
        { id: 2, title: 'Banana Cake', difficulty: 2 },
        { id: 3, title: 'French Fries', difficulty: 1 }
    ]

    def new
        { id: nil, title: nil }
    end

    def create(recipe)
        id = RECIPES.length + 1
        recipe[:id] = id
        RECIPES << recipe
    end

    def all
        RECIPES
    end

    def find(id)
        # 1. find the recipe in the array
        # 2. return that recipe
        id = id.to_i
        RECIPES.find { |recipe| recipe[:id] == id }
    end

    def delete(id)
        id = id.to_i
        idx = RECIPES.index { |recipe| recipe[:id] == id }
        RECIPES[idx] = nil
        # TODO: What happens to new ids?
        RECIPES.compact!
    end

    module_function :new, :find, :all, :create, :delete
end