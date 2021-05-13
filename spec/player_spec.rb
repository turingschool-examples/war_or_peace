require 'rspec'
require './lib/deck'
require './lib/player'

describe Player do
  context 'Attributes' do
    it 'is a player' do
      player = Player.new('name', 'deck')
      expect(player).to be_an_instance_of(Player)
    end

    it 'has a name and deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
  end

  context 'Methods' do
    it 'Return false player has lost?' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to be(false)
    end

    it 'Return true player has lost?' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      deck = Deck.new([card1, card2])
      player = Player.new('Clarisa', deck)

      player.deck.remove_card
      player.deck.remove_card

      expect(player.has_lost?).to be(true)
    end
  end
end
