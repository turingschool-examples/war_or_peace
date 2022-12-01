require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it "exsists" do
        deck = Deck.new("cards")

        expect(deck).to be_a(Deck)
        expect(deck.card).to be_a([])
    end

    # it "holds an array" do
    #     deck = Deck.new
    #     expect(deck).to be_an_instance_of(Deck)
    # end


end
