require 'pry'
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  before (:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
  end

  describe '#initialize' do 
    it 'is an instance of player' do 
      player = Player.new('Clarisa', @deck)
      expect(player).to be_instance_of Player
    end 

    it 'has a name' do 
      player = Player.new('Clarisa', @deck)
      expect(player.name).to eq('Clarisa')
    end 

    it 'can have a different name' do 
      player2 = Player.new('John', @deck)
      expect(player2.name).to eq('John')
    end 
  end 


end  