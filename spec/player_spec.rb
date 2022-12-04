require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do

    it "exsists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player).to be_an_instance_of(Player)
    end

    it "player.name should return 'Clarisa'" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.name).to eq('Clarisa')
    end

    it "player.deck should show 3 cards inside deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.deck).to eq(deck)
    end

    it "player.has_lost? should return false" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it "player.deck.remove_card should show which card removed(card1)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.deck.remove_card).to eq(card1)
    end

    it "player.has_lost? should return false after card1 removed" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        player.deck.remove_card

        # expect(player.deck.remove_card).to eq(card1)
        expect(player.has_lost?).to eq(false)
    end

    it "player.deck.remove_card should show which card removed(card2)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        player.deck.remove_card

        expect(player.deck.remove_card).to eq(card2)
        # expect(player.has_lost?).to eq(false)
    end

    it "player.has_lost? should return false after card2 removed" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        player.deck.remove_card
        player.deck.remove_card
       
        expect(player.has_lost?).to eq(false)
    end

    it "player.deck.remove_card should show which card removed(card3)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        player.deck.remove_card
        player.deck.remove_card
       
        expect(player.deck.remove_card).to eq(card3)
    end

    it "player.has_lost? should return true after card3 removed" do
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

    it "player.deck should show an empty deck(empty array)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)    
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        player.deck.remove_card
        player.deck.remove_card
        player.deck.remove_card
       
        expect(player.deck).to eq(deck)    
    end
 
end

