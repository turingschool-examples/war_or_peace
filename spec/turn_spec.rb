require 'rspec'
require './lib/card'
require './lib/deck' 
require './lib/player'
require './lib/turn'

RSpec.describe Turn do 
  it 'exists and has 2 players and a spoils of war' do 
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

    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)    


    turn = Turn.new(player1, player2) 

    expect(turn).to be_a(Turn)
    expect(turn.player1).to eq(player1)
    expect(turn.player1.name).to eq("Megan")
    expect(turn.player2).to eq(player2)
    expect(turn.player2.name).to eq("Aurora")
    expect(turn.spoils_of_war).to eq([])

  end

  describe '#type' do 
    it 'returns the type of turn based on the rank of the players cards' do 
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

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)    


      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
    end
  end

  describe '#winner' do 
    it 'returns who the winner of each round is' do 
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

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)    


      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)
    end
  end

  describe '#pile_cards' do 
    it 'sends players cards to the spoils of war based on the type of turn' do 
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

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)    


      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)

      turn.pile_cards 

      expect(turn.spoils_of_war).to eq([card1, card3])
    end
  end

  describe '#award_spoils' do 
    it 'adds each of the cards in spoils of war to the winner of the turn' do 
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

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)    


      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1) 

      winner = turn.winner

      turn.pile_cards 

      expect(turn.spoils_of_war).to eq([card1, card3])

      turn.award_spoils(winner) 

      expect(player1.deck).to eq([card2, card5, card8, card1, card3])
      expect(player2.deck).to eq([card4, card6, card7])
    end
  end
end