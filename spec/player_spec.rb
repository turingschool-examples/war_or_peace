require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player).to be_a(Player)
      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
      expect(player.has_lost?).to eq(false)
    end 
  end 

  describe '#has_lost' do 
    it 'will check to see if a player has lost' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14) 
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)

      player.deck.remove_card


      expect(player.has_lost?).to eq(false)

      player.deck.remove_card

      expect(player.has_lost?).to eq(false)

      player.deck.remove_card

      expect(player.has_lost?).to eq(true)
      expect(player.deck.cards).to eq([])
    end 
  end 
end 
