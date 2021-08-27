require './lib/card'
require './lib/deck'
require './lib/player'
require './spec/deck_spec'
require './spec/card_spec'

RSpec.describe Player do
  describe '#initialize' do
    it 'has cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)
      expect(deck.cards).to eq(cards)
      expect(player).to be_a(Player)
    end

  end
end
