require 'rspec'
require './lib/deck'

Rspec.describe Deck do
  describe '#initialize' do
    it "exists" do
      deck = Deck.new(:diamond, "Queen", 12)
      expect(deck).to be_a Deck
    end

    it 'can read the suit' do
      deck = Deck.new(:diamond, "Queen", 12)
      expect(deck.suit) to eq :diamond

    end
  end
