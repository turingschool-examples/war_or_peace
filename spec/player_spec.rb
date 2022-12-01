require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14) 
    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player).to be_an_instance_of(Player)
    end

    it 'has a player name' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14) 
    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        expect(player.name).to eq("Clarisa")
    end

    it "tests if player has lost" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14) 
    
        deck = Deck.new([card1, card2, card3])
        player1 = Player.new('Clarisa', deck)
        expect(player1.has_lost?).to be(false)
    end
    
    it "removes a card from a player's deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14) 
    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        expect(player.deck.remove_card).to eq(card1)
    end

    xit 'player can lose when no more cards in deck' do



        expect(player.has_lost?).to eq(true)

    end
    
end

