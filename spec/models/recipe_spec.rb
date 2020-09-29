require_relative '../../lib/models/recipe'

RSpec.describe Recipe do
    describe 'difficulty' do
        it 'has valid values' do
            recipe = Recipe.new difficulty: 1
            expect(recipe).to be_valid
        end

        it 'has invalid values' do
            recipe = Recipe.new difficulty: 666
            expect(recipe).not_to be_valid
        end
    end
end