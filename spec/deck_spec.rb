require 'rspec'
require './lib/card'
require './lib/deck'

Rspec.describe Deck do 
    let(:card1) { Card.new(:diamond, "Queen", 12) }
    let(:card2) { Card.new(:spade, '3', 3) }
    let(:card3) { Card.new(:heart, 'Ace', 14) }

    let(:cards) { [card1, card2, card3] }
    let(:deck) { Deck.new(cards) }

    describe "#initialize" do
        it "exists" do
            expect(deck).to be_a Deck
        end
    end
