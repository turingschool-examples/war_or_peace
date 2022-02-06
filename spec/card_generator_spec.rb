require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'rspec'
require 'pry'

RSpec.describe CardGenerator do
  describe '#iteration 4' do
    it 'exists' do
      new_deck = CardGenerator.new

      expect(new_deck).to be_a(CardGenerator)
    end

    it 'can add cards' do
      new_deck = CardGenerator.new

      expect(new_deck).to be(52)
    end
  end
end
