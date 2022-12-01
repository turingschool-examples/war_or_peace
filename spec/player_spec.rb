require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.name).to eq("Clarisa")
        expect(player.deck).to eq(deck)
    end

    it "has lost?" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
        expect(player.deck.remove_card).to eq(card1)
        expect(player.has_lost?).to eq(false)
        expect(player.deck.remove_card).to eq(card2)
        expect(player.has_lost?).to eq(false)
        expect(player.deck.remove_card).to eq(card3)
        expect(player.has_lost?).to eq(true)
        expect(player.deck.cards).to eq([])
    end
end