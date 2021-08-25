require 'rspec'
require './lib/deck'

describe Deck do

  describe "#initialize" do
    it "is an instance of Deck" do
      cards = [1,2,3]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe "#rank_of_card_at" do
    context "given 0"
      it "returns the 3rd item in the first item in the array" do
        cards = [[1,2,3],[4,5,6],[7,8,9]]
        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(3)
      end
    end
  end
