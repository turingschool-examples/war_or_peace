require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "exists" do
        player = Player.new("Tim",[])
        expect(player).to be_an_instance_of(Player)
    end

    it "has a deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        player = Player.new('Clarisa', deck)
    end

    it "can lose" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        player = Player.new('Clarisa', deck)

        player.deck.remove_card
        expect(player.has_lost?).to eq(false)

        player.deck.remove_card
        expect(player.has_lost?).to eq(false)

        player.deck.remove_card
        expect(player.has_lost?).to eq(true)

    end

end