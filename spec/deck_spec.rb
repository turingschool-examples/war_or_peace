require 'rspec'
require './lib/deck.rb'

RSpec.describe Deck do
  describe '#initialize' do
    it "is an instance of Deck" do
      deck1 = Deck.new()

      expect(deck1).to be_a Deck
    end

    it 'is an array' do
      deck1 = Deck.new()

      expect(@cards).to be_an_instance_of(Array)
    end
  end

  describe '#high_ranking_cards' do
    it "returns and array of cards" do
      high_ranking_cards = @cards.map do |card|
        @card >= 11
      end

      expect(high_ranking_cards).to be_a array
    end
  end
end
