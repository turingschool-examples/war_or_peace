require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'is an instance of a deck' do
        deck1 = Deck.new('Deck 1')
        expect(deck1).to be_a(Deck)
    end

    it 'has a name' do
        deck1 = Deck.new('Deck 1')
        expect(deck1.name).to eq('Deck 1')
    end

    it 'starts with no cards' do
        deck1 = Deck.new('Deck 1')
        expect(deck1.cards).to eq([])
    end

    it "can add cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.cards).to include(card1, card2, card3)
    end

    it 'can index card rank in deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.rank_of_card_at(0)).to eq(12)
        expect(deck1.rank_of_card_at(2)).to eq(14)
    end

    it 'can find only high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.high_ranking_cards).to eq(card1, card3)
    end

    xit 'can tell what percent of deck is high ranking' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.percent_high_ranking).to eq(66.67)
    end

    xit 'can remove a card from a deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.remove_card).to eq(card1)         # is this correct test??
        expect(deck1.high_ranking_cards).to include(card3)
        expect(deck1.percent_high_ranking).to eq(50)
        card4 = Card.new(:club, '5', 5)
        deck1.add_card(card4)
        expect(deck1.cards).to include(card2, card3, card4)
        expect(deck1.high_ranking_cards).to include(card3)
        expect(deck1.percent_high_ranking).to eq(33.33)
    end
    

end

