require_relative '../../lib/models/assembly.rb'

RSpec.describe Assembly do
    describe 'instance methods' do
        let(:assembly) { Assembly.new }
        it 'should respond to id' do
            expect(assembly).to respond_to :id
        end

        # When the class itself is in the `describe` method, RSpec's one-liner
        # syntax can be used. See:
        # https://relishapp.com/rspec/rspec-core/v/3-9/docs/subject/one-liner-syntax
        it { is_expected.to respond_to :id }

        it 'should respond to materials' do
            expect(assembly).to respond_to :materials
        end

        it 'should respond to title' do
            expect(assembly).to respond_to :title
        end

        it 'should respond to difficulty' do
            expect(assembly).to respond_to :difficulty
        end
    end

    describe 'difficulty' do
        let(:assembly) { Assembly.new }

        it 'should be able to be assigned' do
            assembly.difficulty = 666
            expect(assembly.difficulty).to eq 666
        end

        it 'should be an integer' do
            assembly.difficulty = '555'
            expect(assembly.difficulty).to eq 555
            assembly.difficulty = 'ABC'
            expect(assembly.difficulty).to eq 0
        end
    end

    describe 'valid?' do
        it 'is always valid' do
            expect(Assembly.new).to be_valid
        end
    end

    describe 'save' do
        it 'should be inserted into the ASSEMBLIES array' do
            assembly = Assembly.new
            expect { assembly.save! }.to change(Assembly::ASSEMBLIES, :size).by(1)
        end
    end

    describe 'delete' do
        it 'should have set id to nil' do
            assembly = Assembly.new
            assembly.save!
            assembly.delete
            expect(assembly.id).to be_nil
        end

        it 'should ignore unsaved assemblies' do
            assembly = Assembly.new
            expect(assembly.delete).to be_nil
        end
    end
end