require 'rspec'
require './lib/deck.rb'

describe Deck do
  describe '#initialize' do
    it 'is an instance of deck' do
      deck = Deck.new(Array)
      expect(deck.cards).to be_empty
    end
  end
end
