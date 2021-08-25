require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is an an instance of deck' do
      deck = Deck.new('deck_1')
      expect(deck).to be_a Deck
    end
  end
end
