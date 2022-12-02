require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        player = Player.new('Caleb', deck)
        #require 'pry'; binding.pry
        expect(player).to be_an_instance_of(Player)
    end

    
    it "hasn't lost by default" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        player = Player.new('Caleb', deck)
        #require 'pry'; binding.pry
        expect(player.has_lost?).to eq(false)  
    end
    
    it "can lose" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        player = Player.new('Caleb', deck)
        
        
        expect(player.deck.remove_card).to eq(card1)
        expect(player.has_lost?).to eq(false)
        #require 'pry'; binding.pry
        expect(player.deck.remove_card).to eq(card2)
        expect(player.has_lost?).to eq(false)
        expect(player.deck.remove_card).to eq(card3)
        expect(player.has_lost?).to eq(true)
        expect(player.deck).to eq(deck) 
    end
 end