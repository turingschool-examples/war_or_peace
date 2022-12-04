require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do

    it 'exists' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14) 
        deck = Deck.new([card1, card2, card3])

        player = Player.new('Clarisa', deck)

        expect(player).to be_an_instance_of(Player)
    end

    it 'has player lost?' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14) 
        deck = Deck.new([card1, card2, card3])

        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it "lost" do
  
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = []
      
        deck = Deck.new(cards)
        player = Player.new('Clarisa', deck)
      
        expect(player.has_lost?).to eq(true)
      end
end