require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    let(:card1) { Card.new(:diamond, 'Queen', 12) }
    let(:card2) { Card.new(:spade, '3', 3) }
    let(:card3) { Card.new(:heart, 'Ace', 14) }
    let(:cards) { [card1, card2, card3] }
    let(:deck) { Deck.new(cards) }
    let(:player) { Player.new('Clarisa', deck) }
    
    it "exists" do 
        expect(player).to be_an_instance_of(Player)
    end

    it "can determine if the player has lost" do
        player.has_lost?
        
        expect(player.has_lost?).to eq false
    end

   it "will show the player has lost if no cards remain in the deck" do

        player.deck.remove_card
        player.has_lost?
        
        expect(player.has_lost?).to eq false

        player.deck.remove_card
        player.has_lost?
        
        expect(player.has_lost?).to eq false

        player.deck.remove_card
        player.has_lost?
        
        expect(player.has_lost?).to eq true
    end
end
