require './war_or_peace_runner.rb'
require 'rspec'

describe 'stack_of_cards' do
    it 'has 52 cards' do
        expect(stack_of_cards.count).to eq 52
    end
end 