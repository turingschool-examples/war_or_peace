require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do 
  describe '#initialize' do 
    it 'will exist and have attributes' do 
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

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end 
  end 

  describe '#type' do 
    it 'will return the turn type basic' do 
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
    
    it 'will return the turn type war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:war)
    end 

    it 'will return the turn type mutually assured destruction' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '9', 9)    
      card8 = Card.new(:diamond, '9', 9)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:mutually_assured_destruction)
    end 
  end

  describe '#winner' do 
    it 'will check to see who the winner is for turn basic' do 
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
      winner = turn.winner

      expect(winner).to eq(player1)
    end 
    
    it 'will check to see winner for turn war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      winner = turn.winner

      expect(winner).to eq(player1)
    end 

    it 'will check winner for turn mutually assured destruction' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '9', 9)    
      card8 = Card.new(:diamond, '9', 9)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      winner = turn.winner

      expect(winner).to eq("No Winner")
    end 
  end 

  describe '#pile cards' do 
    it 'will send cards from players decks into spoils of war for turn basic' do 
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
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3])
    end 

    it 'will send cards from players decks into spoils of war for turn war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      turn.pile_cards


      expect(turn.spoils_of_war).to eq([card1, card2, card3, card5, card6, card7])
    end 

    it 'will send cards from players deck into spoils of war for turn mutually assured destruction' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '9', 9)    
      card8 = Card.new(:diamond, '9', 9)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      turn.pile_cards
      
      expect(turn.spoils_of_war).to eq([])
    end 
  end 

  describe '#award spoils' do 
    it 'will award the spoils to the winner' do 
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
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)

      expect(player1.deck.cards).to include(card2, card5, card8, card3, card1)
      expect(player2.deck.cards).to include(card4, card6, card7)
    end 

    it 'will award the spoils to winner for turn war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner) 

      expect(player1.deck.cards).to include(card1, card2, card3, card4, card5, card6, card7)
      expect(player2.deck.cards).to include(card8)
    end 

    it 'will remove cards from spoils of war for mutually assured destruction' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)  
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:diamond, 'Jack', 11)  
      card6 = Card.new(:diamond, 'Queen', 12)   
      card7 = Card.new(:heart, '9', 9)    
      card8 = Card.new(:diamond, '9', 9)  
      deck1 = Deck.new([card1, card2, card3, card4])    
      deck2 = Deck.new([card5, card6, card7, card8]) 
      player1 = Player.new("Megan", deck1)   
      player2 = Player.new("Aurora", deck2)  
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([])
    end 
  end 

end 