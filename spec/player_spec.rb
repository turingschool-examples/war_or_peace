require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do

# create another before block

  describe '#initialize' do
    it 'player name is Clarisa' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.name).to eq('Clarisa')
    end

    it 'player deck has card1, card2, and card3' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.deck).to eq(deck)
    end
  end

  describe "#has_lost?" do
    it 'player has not lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to eq(false)
    end

    it 'player still has two cards; has not lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
    end

    it 'player still has one card; has not lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      player.deck.remove_card
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
    end

    it 'player has no cards; has lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      player.deck.remove_card
      player.deck.remove_card
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
    end
  end
end
