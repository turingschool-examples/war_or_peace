require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  context "when the turn type is basic"  
    it "exists" do
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
      expect(turn).to be_an_instance_of (Turn)
    end

    it "has players from the player class" do
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
      expect(turn.player1).to be_an_instance_of(Player)
      expect(turn.player2).to be_an_instance_of(Player)
    end

    it "has a spoil of wars pile that is initially empty" do
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
      expect(turn.spoils_of_war.empty?).to eql(true)
    end

    it "can have types of turns based on the top cards of the deck" do
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
      expect(turn.type).to eql(:basic)
    end

    it "can determine a winner" do
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
      expect(turn.winner.name).to eql("Megan")
    end

    it "can move cards from the deck to the spoils of war pile" do
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
      expect(deck1.cards).to eql([card2, card5, card8])
      expect(deck2.cards).to eql([card4, card6, card7])
      expect(turn.spoils_of_war.size).to eq(2)
    end 

    it "can move cards from the spoils of war pile to the winner" do
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
      expect(turn.spoils_of_war.size). to eql(0)
      expect(winner.deck.cards.length). to eql(5)
    end 
  context "when the turn type is war" 
    it "can have a different type" do
      card1 = Card.new(:heart, 'Jack', 11)  
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)   
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12) 
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2) 
      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2) 
      expect(turn.type). to eql(:war)
    end

    it "it can move cards from the deck to the spoils of war pile" do
      card1 = Card.new(:heart, 'Jack', 11)  
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)   
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12) 
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2) 
      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2) 
      turn.pile_cards
      expect(deck1.cards).to eql([card8])
      expect(deck2.cards).to eql([card7])
      expect(turn.spoils_of_war.size).to eq(6)
    end

    it "can move cards from the spoils of war pile to the winner" do
      card1 = Card.new(:heart, 'Jack', 11)  
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)   
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12) 
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2) 
      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)   
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(turn.spoils_of_war.size). to eql(0)
      expect(winner.deck.cards.length). to eql(7)
    end

  context "when the turn type is mutually assured destruction"
    it "can have a different type" do
      card1 = Card.new(:heart, 'Jack', 11)  
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9)  
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8) 
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2) 
      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card4, card3, card6, card7]) 
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type). to eql(:mutually_assured_destruction)
    end

    it "it will remove cards from the game" do
      card1 = Card.new(:heart, 'Jack', 11)  
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9)  
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8) 
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2) 
      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card4, card3, card6, card7]) 
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils_of_war). to eql([])
      expect(player1.deck.cards). to eql([card8])
      expect(player2.deck.cards). to eql([card7])
    end
end



