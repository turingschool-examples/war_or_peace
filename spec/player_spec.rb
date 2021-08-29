require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  describe '#initialize' do
    it 'has a name' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.name).to be_a String
    end
    it 'has a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.deck).to be_a Deck
    end
  end

  describe '#has_lost?' do
    it "will return a Boolean value" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to be false
    end
    it "will return a true when deck is empty" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to be false
    end
  end
  
  describe '#remove_card'do
    it "will remove the first card from deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(deck.size).to eq(3)
      player.remove_card
      expect(deck.size).to eq(2)
    end
  end
end
