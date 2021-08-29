require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

describe Player do

  describe '#initialize' do
    it 'is an instance of player' do
      player = Player.new('Clarisa','deck_1')

      expect(player).to be_a Player
    end
    it 'has readable attributes' do

      player = Player.new('Clarisa','deck_1')

      expect(name).to be_a String
      expect(deck).to be_a Deck
    end
  end

  describe '#has_lost' do
    it 'determines if player loses' do
      player = Player.new('Clarisa','deck_1')

      expect(deck_1).to eq 0
    end
  end    
end
