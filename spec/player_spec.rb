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
    @cards = [@card1, @card2, @card3]
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

    it 'has a deck that contains cards' do 
      player = Player.new('Clarisa', @deck)
      expect(player.deck).to eq(@deck)
      expect(player.deck.cards).to eq([@card1, @card2, @card3])
    end 
  end 

  describe '#has_lost?' do 
    it 'returns true if the player lost' do 
      player = Player.new('Clarisa', @deck)
      expect(player.deck.cards).to eq([@card1, @card2, @card3])
      player.deck.remove_card 
      expect(player.deck.cards).to eq([@card2, @card3])
      expect(player.has_lost?).to be false 
      player.deck.remove_card 
      expect(player.deck.cards).to eq([@card3])
      expect(player.has_lost?).to be false  
      player.deck.remove_card 
      expect(player.deck.cards).to eq([])
      expect(player.has_lost?).to be true
    end 
  end
end  