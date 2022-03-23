require 'rspec'
require './lib/player'
require './lib/card'
require './lib/deck'

describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  describe 'Test' do
    it 'exists' do
      expect(@player).to be_instance_of(Player)
    end
    it 'returns players name' do
      expect(@player.name).to eq('Clarisa')
    end
    it 'returns player' do
      expect(@player.deck).to eq(@deck)
    end
  end
end
