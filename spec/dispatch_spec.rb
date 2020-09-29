require_relative '../lib/dispatch'

RSpec.describe 'dispatch' do
    # Dispatch isn't a class or module, just a method. That's probably
    # not a good thing, since I'd like to be able to test respond_to?

    it "routes 'list' to RecipesController::index" do
        expect(RecipesController).to receive :index
        dispatch 'list' 
    end

    it "routes 'show' to RecipesController::show" do
        expect(RecipesController).to receive(:show).with('666')
        dispatch 'show', '666' 
    end
end