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

    it "deck.cards should show cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        # deck = Deck.new([card1, card2, card3])
        deck = Deck.new(cards)
        
        expect(deck.cards).to eq(cards)
    end

    it "deck.rank_of_card_at(#) can access the rank_of_card_at a certain index number" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "deck.high_ranking_cards should show the 2 high_ranking_cards in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "deck.percent_high_ranking should show the percentage of high ranking cards in the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(66.67)
    end

    it "deck.remove_card should remove the card from top of deck (index position 0)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
    end

 it "deck.cards should show cards left in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.cards).to eq([card2, card3])
    end


    it "deck.high_ranking_cards should show remaining high_raking_cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.high_ranking_cards).to eq([card3])
    end

    it "deck.percent_high_ranking should show percent_high_raking cards left in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.percent_high_ranking).to eq(50.0)
    end

    it "card4 exsists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)

        expect(card4).to be_an_instance_of(Card)
    end

    #Does this test need to be done at all? 
    it "deck.add_card(card4) should add that card to the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)
        deck.remove_card

        expect(deck.add_card(card4)).to eq(cards)
    end

    it "deck.cards should show the new card was added to the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)
        deck.remove_card
        deck.add_card(card4)

        #expect(deck.cards).to eq([card2, card3, card4])
        expect(deck.cards).to eq(cards)
    end

    it "deck.high_ranking_cards should show the high ranking cards left in deck (card3)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)
        deck.remove_card
        deck.add_card(card4)

        expect(deck.high_ranking_cards).to eq([card3])
    end

    it "deck.percent_high_ranking should show percentage of high ranking cards left in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)
        deck.remove_card
        deck.add_card(card4)

        # expect(deck.remove_card).to eq(card1)
        # expect(deck.cards).to eq([card2, card3])
        # expect(deck.add_card(card4)).to eq(cards)
        # expect(deck.cards).to eq(cards)
        # expect(deck.high_ranking_cards).to eq([card3])
        
        expect(deck.percent_high_ranking).to eq(33.33)
    end

end
