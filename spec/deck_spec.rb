require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require 'pry'

describe Deck do
  # describe '#initialize' do
    it "exists" do
      deck = Deck.new(:diamond, "Queen", 12)

      expect(deck).to be_an_instance_of(Deck)
    end

    # it 'can read the suit' do
    #   deck = Deck.new(:diamond, "Queen", 12)
    #   expect(deck.suit) to eq(:diamond)
    #
    # end
  end
