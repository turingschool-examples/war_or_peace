require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    it 'exists' do
        player = Player.new('Clarisa', @deck)
        expect(player).to be_a(Player)
    end
        
    it 'deck has cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)
      expect(player.deck.cards).to eq([card1, card2, card3]) 
    end

  
    describe '#has_lost?' do
      it 'tells if player has lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        player = Player.new('Clarisa', deck)
        player.deck.remove_card
        expect(player.deck.cards).to eq([card2, card3])
        expect(player.has_lost?).to eq false
        player.deck.remove_card
        expect(player.deck.cards).to eq([card3])
        expect(player.has_lost?).to eq false
        player.deck.remove_card
        expect(player.deck.cards).to eq([])
        expect(player.has_lost?).to eq true
      end
    end
end




        
        
      


