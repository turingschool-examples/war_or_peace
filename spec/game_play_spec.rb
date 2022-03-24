require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_play'

describe GamePlay do

  it "exists" do
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

    play = GamePlay.new(player1, player2)

    expect(play).to be_an_instance_of(GamePlay)
  end

  describe "#start" do
    it "runs an entire game and returns a string designating the winner" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "6", 6)
      card5 = Card.new(:heart, "King", 13)
      card6 = Card.new(:diamond, "2", 2)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "Queen", 13)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      play = GamePlay.new(player1, player2)

      expect(play.start).to eq("*~*~*~* Megan has won the game! *~*~*~*")
    end

    it "runs an entire game that results in a draw" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "2", 2)
      card3 = Card.new(:heart, "4", 4)
      card4 = Card.new(:diamond, "Ace", 14)
      card5 = Card.new(:heart, "King", 13)
      card6 = Card.new(:diamond, "2", 2)
      card7 = Card.new(:heart, "Queen", 12)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      play = GamePlay.new(player1, player2)

      expect(play.start).to eq("---- DRAW ----")
    end

    it "handles the case when one player does not have enough cards when type is war" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "2", 2)
      card3 = Card.new(:diamond, "Jack", 11)
      card4 = Card.new(:diamond, "Ace", 14)
      card5 = Card.new(:heart, "King", 13)
      card6 = Card.new(:diamond, "2", 2)
      card7 = Card.new(:heart, "Queen", 12)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2])
      deck2 = Deck.new([card3, card4, card6, card7, card5, card8])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      play = GamePlay.new(player1, player2)

      expect(play.start).to eq("*~*~*~* Aurora has won the game! *~*~*~*")
    end
  end

end
