require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

#turn type :basic
describe Turn do
  # before(:each) do
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3) 
    # card3 = Card.new(:heart, 'Ace', 14)
    #   card4 = Card.new(:diamond, 'Jack', 11)   
    #   card5 = Card.new(:heart, '8', 8) 
    #   card6 = Card.new(:diamond, 'Queen', 12)
    #   card7 = Card.new(:heart, '3', 3)
    #   card8 = Card.new(:diamond, '2', 2)
    #   deck1 = Deck.new([card1, card2, card5, card8])
    #   deck2 = Deck.new([card3, card4, card6, card7]) 
    #   player1 = Player.new('Megan', deck1)
    #   player2 = Player.new('Aurora', deck2)
    #   turn = Turn.new(player1, player2) 
    # end
  describe '#initialize' do
    it 'exists and has attributes' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:diamond, 'Jack', 11)   
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7]) 

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
      
      turn = Turn.new(player1, player2) 

      expect(turn).to be_a(Turn)
      expect(turn.player1.name).to eq('Megan')
      expect(turn.player2.name).to eq('Aurora')
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe '#type' do
    it 'has a :basic turn types' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:diamond, 'Jack', 11)   
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
  
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7]) 
  
      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
        
      turn = Turn.new(player1, player2) 
  
      expect(turn.type).to eq(:basic)

      # create test for :winner and :spoils_of_war
      # it 'has a :winner turn types' do
      # expect(turn.type).to eq(:war)
      # it 'has a :mutually_assured_destruction turn types' do
      # expect(turn.type).to eq(:mutually_assured_destruction)
      # expect(turn.).to eq()
    end
  end

  describe '#winner:' do
    it 'determines the winner of the turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)   
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
  
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7]) 
  
      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)
        
      turn = Turn.new(player1, player2) 
      winner = turn.winner
  
      expect(turn.winner.name).to eq('Megan')
      expect(turn.type).to eq(:basic)
    end
  end
end