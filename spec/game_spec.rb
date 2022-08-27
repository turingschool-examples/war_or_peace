require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  describe "initialize game" do
    
    it "is an instance of its class" do
      card1 = Card.new(:spade, 'Ace', 14)
      card4 = Card.new(:club, '10', 10)
      deck1 = Deck.new(card1)
      deck2 = Deck.new(card4)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)
      
      expect(game).to be_an_instance_of(Game)
    end
    
    it "it has 2 players" do
      card1 = Card.new(:spade, 'Ace', 14)
      card4 = Card.new(:club, '10', 10)
      deck1 = Deck.new(card1)
      deck2 = Deck.new(card4)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)
      
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end
    
    it "#start" do
      card1 = Card.new(:spade, 'Ace', 14)
      card4 = Card.new(:club, '10', 10)
      deck1 = Deck.new(card1)
      deck2 = Deck.new(card4)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)  
      
      display.stub(:gets).and_return("GO\n")
    end
    
    it "#play" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:diamond, '2', 2)
      card6 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)
      
      game.play
      
      expect(player2.has_lost?).to eq(true)
    end
    
    it "resolve war or mad when a player has fewer that 3 cards" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, 'Jack', 11)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, 'Ace', 14)
      card5 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)
      
      game.play
      
      expect(player2.has_lost?).to eq(true)
    end
  end
end