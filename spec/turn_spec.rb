require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  
  describe "initialize" do
    it "is an instance of its class" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      expect(turn).to be_an_instance_of(Turn)
    end
    
    it "with 2 players" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
    end
    
    it "with a spoils_of_war attribute" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.spoils_of_war).to eq([])
    end
  end
  
  describe "behaviors" do
    
    it "#type :basic" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:basic)
    end
    
    it "#type :war" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:diamond, 'Ace', 14)
      card5 = Card.new(:club, '10', 10)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:war)
    end
    
    it "#type :mutually_assured_destruction" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:diamond, 'Ace', 14)
      card5 = Card.new(:club, '10', 10)
      card6 = Card.new(:heart, '8', 8)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:mutually_assured_destruction)
    end
    
    it "#winner :basic" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.winner).to eq(player1)
    end
    
    it "#winner :war" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:diamond, 'Ace', 14)
      card5 = Card.new(:club, '10', 10)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.winner).to eq(player1)
    end
    
    it "#winner :mutually_assured_destruction" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:diamond, 'Ace', 14)
      card5 = Card.new(:club, '10', 10)
      card6 = Card.new(:heart, '8', 8)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.winner).to eq("No Winner")
    end
    
    it "#pile_cards :basic" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      
      expect(turn.spoils_of_war).to eq([card1, card4])
    end
    
    it "#pile_cards :war" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:diamond, 'Ace', 14)
      card5 = Card.new(:club, '10', 10)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      
      expect(turn.spoils_of_war).to eq([card1, card4, card2, card5, card3, card6])
    end
      
    it "#pile_cards :mutually_assured_destruction" do
      card1 = Card.new(:spade, '10', 10)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '5', 5)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      
      expect(player1.deck.cards).to eq([])
      expect(player2.deck.cards).to eq([])
    end
    
    it "#award_spoils :basic" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      turn_winner = turn.winner
      turn.pile_cards
      turn.award_spoils(turn_winner)
        
      expect(player1.deck.cards[-1]).to eq(card4)
      expect(player1.deck.cards[-2]).to eq(card1)
      expect(player2.deck.cards[0]).to eq(card5)
    end
    
    it "#award_spoils :war" do
      card1 = Card.new(:spade, '10', 10)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, 'Ace', 14)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      turn = Turn.new(player1, player2)
      
      turn_winner = turn.winner
      turn.pile_cards
      turn.award_spoils(turn_winner)
      
      expect(player1.deck.cards[-6..-1]).to eq([card1, card4, card2, card5, card3, card6])
      expect(player2.deck.cards).to eq([])
    end
  end
end





















