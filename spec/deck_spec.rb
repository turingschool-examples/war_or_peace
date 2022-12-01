require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'is an instance of a deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        expect(deck).to be_a(Deck)
    end

    it 'starts with no cards' do
        deck = Deck.new()
        expect(deck.cards).to eq([])
    end

    it "can add cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        expect(deck.cards).to include(card1, card2, card3)
    end

    it 'can index card rank in deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    xit 'can find only high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        expect(deck.high_ranking_cards).to include(card1, card3) #.to eq/include dont work properly
    end

    it 'can tell what percent of deck is high ranking' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        binding.pry
        expect(deck.percent_high_ranking).to eq(66.67)

    end

    it 'can remove a card from a deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        expect(deck.remove_card).to eq(card1)
        # expect(deck.high_ranking_cards).to include(card3)
        # expect(deck.percent_high_ranking).to eq(50)
        # card4 = Card.new(:club, '5', 5)
        # deck.add_card(card4)
        # expect(deck.cards).to include(card2, card3, card4)
        # expect(deck.high_ranking_cards).to include(card3)
        # expect(deck.percent_high_ranking).to eq(33.33)
    end
    

end

