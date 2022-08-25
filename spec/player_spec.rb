require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before(:each) do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, '8', 8)
    cards = [card1, card2, card3]
    @deck = Deck.new(cards)
    @player = Player.new('John', @deck)
  end
  describe 'initialized in before(:each)' do
  
    it "is an instance of its class" do
      expect(@player).to be_an_instance_of(Player)
    end
    
    it "has a name" do
      expect(@player.name).to eq('John')
    end
    
    it "is initialized with a deck" do
      expect(@player.deck).to eq(@deck)
    end
  end
  
  describe 'behaviors' do
    
    it "#has_lost? method returns boolean value for 
    zero or non-zero number of cards in deck" do
      expect(@player.has_lost?).to eq(false)
      @deck.remove_card
      @deck.remove_card
      @deck.remove_card
      expect(@player.has_lost?).to eq(true)
    end
  end
end