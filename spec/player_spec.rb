require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do

    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it 'has a name' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
  end

  it 'has a deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)
  end

  describe '#has_lost?' do
    it 'has not lost by default' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)
    end

    it 'has lost when 0 cards in deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      player.deck.remove_card

      expect(player.has_lost?).to eq(false)
      player.deck.remove_card

      expect(player.has_lost?).to eq(false)
      player.deck.remove_card

      expect(player.has_lost?).to eq(true)
    end
  end



end
