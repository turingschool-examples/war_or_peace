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

    it "deck.cards should show 3 cards in deck" do
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

    it "deck.cards should still show 3 cards in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        # deck = Deck.new([card1, card2, card3])
        deck = Deck.new(cards)
        
        expect(deck.cards).to eq(cards)
    end

    it "deck.high_ranking_cards should show high ranking cards(card1, card3) in deck" do
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

    it "deck.remove_card should the card being removed(card1) from top of deck (index position 0)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
    end

 it "deck.cards should show 2 cards left in deck(card2, card3)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.cards).to eq([card2, card3])
    end


    it "deck.high_ranking_cards should show remaining high raking cards(card3) in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.high_ranking_cards).to eq([card3])
    end

    it "deck.percent_high_ranking should show percent of high raking cards left in deck" do
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

    #Does this test make sense? No. (no grey return information in iteraction pattern)
    # it "deck.add_card(card4) should add that card to the deck" do
    #     card1 = Card.new(:diamond, 'Queen', 12)
    #     card2 = Card.new(:spade, '3', 3)
    #     card3 = Card.new(:heart, 'Ace', 14)
    #     cards = [card1, card2, card3]    

    #     deck = Deck.new(cards)

    #     card4 = Card.new(:club, '5', 5)
    #     deck.remove_card

    #     expect(deck.add_card(card4)).to eq(cards)
    #     require "pry"; binding.pry
    # end

    it "deck.cards should show 3 cards in deck(card2, card3, card4)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]    

        deck = Deck.new(cards)

        card4 = Card.new(:club, '5', 5)
        deck.remove_card
        deck.add_card(card4)

        # expect(deck.cards).to eq([card2, card3, card4])
        expect(deck.cards).to eq(cards)
    end

    it "deck.high_ranking_cards should show the high ranking card(card3) left in deck" do
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

        # I'm leaving this old work to remember I what I originally had to make the test pass.
        # Then I learned that we can call methods inside the test once they're created!

        # expect(deck.remove_card).to eq(card1)
        # expect(deck.cards).to eq([card2, card3])
        # expect(deck.add_card(card4)).to eq(cards)
        # expect(deck.cards).to eq(cards)
        # expect(deck.high_ranking_cards).to eq([card3])
        
        expect(deck.percent_high_ranking).to eq(33.33)
    end

end
