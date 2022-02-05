require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/standard_deck'

RSpec.describe StandardDeck do
  it 'exists' do
    deck = StandardDeck.new
# require 'pry'; binding.pry
  expect(deck.standard_deck.cards.count).to eq(52)
  end
end
