require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/gameplay'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'can generate_cards' do
    deck = CardGenerator.new('./cards.txt')
    deck.create_cards
    # binding.pry
    expect(deck.cards[0].suit).to eq(:club)
  end

  it 'can send the cards to the deck' do
    cards = CardGenerator.new('./cards.txt')
    cards.create_cards
    deck = Deck.new(cards)
    # binding.pry
    expect(deck.cards.cards[0].suit).to eq(:club)
  end

  it 'can shuffle' do
    deck = CardGenerator.new('./cards.txt')
    deck.create_cards
    deck.cards.shuffle!
    expect(deck.cards[0].rank).to be == 2
  end
end
