require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do 
  before (:each) do 
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10) 
    @card3 = Card.new(:heart, '9', 9) 
    @card4 = Card.new(:diamond, 'Jack', 11)  
    @card5 = Card.new(:heart, '8', 8) 
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Dug', @deck1)
    @player2 = Player.new('Fran', @deck2)
  end 

  describe '#initialize' do 
    it 'is an instance of turn' do
      turn = Turn.new(@player1, @player2)
      
      expect(turn).to be_instance_of Turn
    end

    it 'has a first player' do
      turn = Turn.new(@player1, @player2)
      
      expect(turn.player1).to eq(@player1)
    end 

    it 'has a second player' do
      turn = Turn.new(@player1, @player2) 
      
      expect(turn.player2).to eq(@player2)
    end 

    it 'has no spoils of war by default' do
      turn = Turn.new(@player1, @player2)
      
      expect(turn.spoils_of_war).to eq []
    end 
  end  
end 