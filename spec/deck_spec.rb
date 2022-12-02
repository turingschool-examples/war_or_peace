require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

    it "exists" do 
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it "has cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        # deck = Deck.new([card1, card2, card3])
        deck = Deck.new(cards)
        
        expect(deck.cards).to eq(cards)
    end

    it "can access the rank_of_card_at index number" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "shows the high_ranking_cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "shows the percent_high_ranking" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(66.67)
    end

    it "can remove_card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
    end

 it "show cards left in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
        expect(deck.cards).to eq([card2, card3])
    end


    it "show remaining high_raking_cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
        expect(deck.cards).to eq([card2, card3])
        expect(deck.high_ranking_cards).to eq([card3])
    end

    it "show percent_high_raking cards left" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
        expect(deck.cards).to eq([card2, card3])
        expect(deck.high_ranking_cards).to eq([card3])
        expect(deck.percent_high_ranking).to eq(50.0)
    end

    it "can add_card to deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)

        expect(deck.remove_card).to eq(card1)
        expect(deck.cards).to eq([card2, card3])
        expect(deck.add_card(card4)).to eq(cards)
    end

    it "show add_card is in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)

        expect(deck.remove_card).to eq(card1)
        expect(deck.cards).to eq([card2, card3])
        expect(deck.add_card(card4)).to eq(cards)
        expect(deck.cards).to eq(cards)
    end

end
