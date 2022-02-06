require 'rspec'
require './lib/standard_deck'

RSpec.describe StandardDeck do
  it 'exists' do
    my_deck = StandardDeck.new
# require 'pry'; binding.pry
  expect(my_deck.standard_deck.count).to eq(52)
  end
end
