require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'can create a full deck' do
      filename = './data/cards.txt'

      unshuffled_deck = CardGenerator.new(filename).cards

      player1_deck = Deck.new(unshuffled_deck)

      expect(player1_deck.cards).to eq(unshuffled_deck)
      expect(player1_deck.cards.length).to eq(52)
    end

    it 'can create cards with readable attributes' do
      filename = './data/cards.txt'

      unshuffled_deck = CardGenerator.new(filename).cards

      player1_deck = Deck.new(unshuffled_deck)

      expect(player1_deck.rank_of_card_at(0)).to eq(2)
      expect(player1_deck.cards[0].value).to eq("2")
      expect(player1_deck.cards[0].suit).to eq(:heart)
      expect(player1_deck.cards[21].suit).to eq(:diamond)
      expect(player1_deck.cards[37].value).to eq("King")
      expect(player1_deck.rank_of_card_at(51)).to eq(14)
    end
  end
end
