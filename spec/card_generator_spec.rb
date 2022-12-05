require 'rspec'
require './lib/card_generator'
require './lib/game'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe CardGenerator do
    cards = CardGenerator.new("cards.txt")

    it "exists" do
        expect(cards).to be_an_instance_of(CardGenerator)
        expect(cards.cards).to eq([])
    end
  
    it "can is the correct file name" do
        expect(cards.filename).to eq("cards.txt")
    end


    it "can make a deck from the text file" do
        cards.read

        expect(cards.cards[29]).to be_an_instance_of(Card)
        expect(cards.cards.length).to eq(52)
        expect(cards.cards[0].rank).to eq(2)
        expect(cards.cards[51].rank).to eq(14)
        expect(cards.cards[51].suit).to eq(:club)
        expect(cards.cards[51].value).to eq('ace')

        deck = Deck.new(cards)

        expect(deck.cards.cards.length).to eq(52)
        expect(deck.cards.cards[0].rank).to eq(2)
        expect(deck.cards.cards[51].rank).to eq(14)
        expect(deck.cards.cards[51].suit).to eq(:club)
        expect(deck.cards.cards[51].value).to eq('ace')
    end
  end