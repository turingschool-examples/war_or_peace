require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

RSpec.describe Player do
    before :each do 
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14) 
        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards)
    end


    it "exists and has readable attributies" do
        player1=Player.new("Michi",@deck)
        expect(player1).to be_an_instance_of(Player)
        expect(player1.name).to eq("Michi")
        expect(player1.deck).to eq(@deck)
    end

    it "has_lost? returns false by default" do
        player1=Player.new("Michi",@deck)

        expect(player1.has_lost?).to eq(false)

        player1.deck.remove_card
        expect(player1.has_lost?).to eq(false)

        player1.deck.remove_card
        expect(player1.has_lost?).to eq(false)

        player1.deck.remove_card
        expect(player1.has_lost?).to eq(true)
        expect(player1.deck.cards).to eq([])

    end

    it "remove card from deck" do
        player1=Player.new("Michi",@deck)
        player1.deck.remove_card
        expect(player1.deck.cards).to eq([@card2, @card3])
    end
end