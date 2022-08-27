require "rspec"
require "./lib/game"

RSpec.describe Game do 
  describe "#initialize" do 
    it "is a Game" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      game = Game.new(player1, player2)
      expect(game).to be_a Game 
    end
  end

  describe "start" do
    it "will end the game after 1,000,000 turns if nobody wins" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      game = Game.new(player1, player2)
      expect(game.start).to eq 3  
    end

    it "will end after a winner is declared (player2)" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:club, "Jack", 11)
      card3 = Card.new(:spade, "Jack", 11)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)            
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      game = Game.new(player1, player2)
      expect(game.start).to eq 2  
    end

    it "will end after a winner is declared (player1)" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:club, "Jack", 11)
      card3 = Card.new(:spade, "Jack", 11)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)            
      deck1 = Deck.new([card3, card4, card6, card7])
      deck2 = Deck.new([card1, card2, card5, card8])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      game = Game.new(player1, player2)
      expect(game.start).to eq 1  
    end
  end
end