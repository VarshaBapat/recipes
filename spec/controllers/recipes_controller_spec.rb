require_relative '../../lib/controllers/recipes_controller'

RSpec.describe RecipesController do
    let(:valid_recipe) { Recipe.new difficulty: 1 }

    before(:each) do
        # This is a bit naughty... mutating the `ASSEMBLILES` array to []!
        # In theory, this method should be called `clear!`
        # We need to do this since we want `ASSEMBLIES` to be a fresh empty
        # array for each test.
        Assembly::ASSEMBLIES.clear
        valid_recipe.save!
    end

    it { is_expected.to respond_to :index }
    it { is_expected.to respond_to :show }
    it { is_expected.to respond_to :new }
    it { is_expected.to respond_to :edit }
    it { is_expected.to respond_to :destroy }

    describe '::index' do
        it 'should render index views' do
            expect(Views::Recipes).to receive(:index).with(recipes: [valid_recipe])
            RecipesController.index
        end
    end

    describe '::show' do
        it 'should render show views' do
            expect(Views::Recipes).to receive(:show).with(recipe: valid_recipe)
            RecipesController.show valid_recipe.id
        end
    end
end