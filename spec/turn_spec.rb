
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe 'initialize' do
    it 'exists' do
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
      player2 = Player.new("Aurora",deck2)
      turn = Turn.new(player1, player2)    

      expect(turn).to be_an_instance_of(Turn)
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end


  describe 'has types of turns and game flow with winners' do
    it 'has a :basic type of turn' do
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
      player2 = Player.new("Aurora",deck2)
      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
      expect(winner = turn.winner).to eq(player1)

      winner = turn.winner
      turn.pile_cards
      
      expect(turn.spoils_of_war).to eq([card1, card3])
      
      turn.award_spoils(winner)

      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)
    end

    it "has a :war turn" do
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

      expect(turn.type).to eq(:war)
      winner = turn.winner
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card2, card3, card4, card5, card6])

      turn.award_spoils(winner)

      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)

player2.deck


    end

    xit "has a :mutually_assured_destruction turn" do
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
      
      expect(turn.type).to eq(:mutually_assured_destruction)
      winner = turn.winner
      turn.pile_cards
      turn.spoils_of_war
      player1.deck
      player2.deck
    end
  end
end

  #I TOOK THIS BLOCK OUT AND PUT THE EXPECT LINE IN THE :BASIC TURN BLOCK
  # describe 'has a winner and cards get shifted based on winner' do
  #   it "#winner" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)    
  #   card3 = Card.new(:heart, '9', 9)    
  #   card4 = Card.new(:diamond, 'Jack', 11)    
  #   card5 = Card.new(:heart, '8', 8)    
  #   card6 = Card.new(:diamond, 'Queen', 12)    
  #   card7 = Card.new(:heart, '3', 3)    
  #   card8 = Card.new(:diamond, '2', 2)    
  #   deck1 = Deck.new([card1, card2, card5, card8])    
  #   deck2 = Deck.new([card3, card4, card6, card7])    
  #   player1 = Player.new("Megan", deck1)    
  #   player2 = Player.new("Aurora",deck2)
  #   turn = Turn.new(player1, player2) 

  #   expect(winner = turn.winner).to eq(player1)
  # end
  


  #PUT THESE WINNER = TURN.WINNER, EXPECT STATEMENTS AND GAME FLOW IN :BASIC BLOCK
  # it 'shifts cards with #pile_cards and #award_spoils' do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)    
  #   card3 = Card.new(:heart, '9', 9)    
  #   card4 = Card.new(:diamond, 'Jack', 11)    
  #   card5 = Card.new(:heart, '8', 8)    
  #   card6 = Card.new(:diamond, 'Queen', 12)    
  #   card7 = Card.new(:heart, '3', 3)    
  #   card8 = Card.new(:diamond, '2', 2)    
  #   deck1 = Deck.new([card1, card2, card5, card8])    
  #   deck2 = Deck.new([card3, card4, card6, card7])    
  #   player1 = Player.new("Megan", deck1)    
  #   player2 = Player.new("Aurora",deck2)
  #   turn = Turn.new(player1, player2) 
  #   winner = turn.winner
    
  #   turn.pile_cards
    
  #   expect(turn.spoils_of_war).to eq([card1, card3])
    
  #   turn.award_spoils(winner)
  #   expect(player1.deck).to eq(deck1)
  #   expect(player2.deck).to eq(deck2)
 