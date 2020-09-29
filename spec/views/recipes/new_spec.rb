
require_relative '../../../lib/models/recipe'
require_relative '../../../lib/views/recipes/new'

RSpec.describe 'recipes/new' do
    let(:view) { Views::Recipes }
    let(:recipe) { Recipe.new }

    it 'should render' do
        allow(view).to receive(:gets).and_return('Pudding', '5')
        expect{ view.new recipe: recipe }.to output(/New Recipe!/).to_stdout
    end

    it 'should assign the inputs to the recipe' do
        expected_title = 'Pudding'
        expected_difficulty = 5
        allow(view).to receive(:gets).and_return(expected_title, expected_difficulty.to_s)
        expect{ view.new recipe: recipe }.to output.to_stdout
        expect(recipe.title).to eq expected_title
        expect(recipe.difficulty).to eq expected_difficulty
    end

    context 'when input is blank for an existing recipe' do
        let(:valid_title) { 'Pudding' }
        let(:valid_difficulty) { 1 }
        let(:recipe) { Recipe.new title: valid_title, difficulty: valid_difficulty }

        before(:each) do
            # For the gets in the view, return an empty string for the
            # prompts for both title and difficulty so that the default value
            # will be used.
            allow(view).to receive(:gets).and_return('', '')
        end

        it "should use the recipe's existing title" do
            expect{ view.new recipe: recipe }.to output(/Title \(#{valid_title}\)/).to_stdout
            expect(recipe.title).to eq valid_title
        end

        it "should use the recipe's existing difficulty" do
            expect{ view.new recipe: recipe }.to output(/\(#{valid_difficulty}\)/).to_stdout
            expect(recipe.difficulty).to eq valid_difficulty
        end
    end
end