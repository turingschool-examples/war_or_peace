require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do
    before :each do 
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14) 
        @cards = [@card1, @card2, @card3]
    end


    it "exists" do
        deck = Deck.new(@cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it "has readable attributes" do
        deck = Deck.new(@cards)

        expect(deck.cards).to eq(@cards)
    end
    
    
    
    it "can check rank of cards" do 
        deck = Deck.new(@cards)
        card1_rank = deck.rank_of_card_at(0)
        card2_rank = deck.rank_of_card_at(1)
        
        expect(card1_rank).to eq 12
        expect(card2_rank).to eq 3
    end
    
    it "can return high ranking cards" do 
        deck = Deck.new(@cards)
        high_rank_cards = deck.high_ranking_cards
        
        expect(high_rank_cards).to eq [@card1,@card3]
    end
    
    it "can calculate % high ranking" do
        deck = Deck.new(@cards)
        percent_high = deck.percent_high_ranking
        expect(percent_high).to eq 66.67
    end
    
    it "can remove cards" do
        deck = Deck.new(@cards)
        
        expect(deck.cards).to eq([@card1, @card2,@card3])
        
        deck.remove_card
        
        expect(deck.cards).to eq [@card2,@card3]
    end
    
    it "can add cards" do
        deck = Deck.new(@cards)
        new_card = Card.new(:spade, '4', 4)
        
        expect(deck.cards).to eq([@card1, @card2,@card3])
    
        deck.add_card(new_card)
        high_cards = deck.high_ranking_cards


        expect(deck.cards).to eq([@card1, @card2, @card3, new_card])
        expect(high_cards).to eq([@card1,@card3])
        expect(deck.percent_high_ranking).to eq(50.0)
    end

end
