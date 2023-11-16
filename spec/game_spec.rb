require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/game"

RSpec.describe Game do
let!(:card1) { Card.new(:heart, 'Jack', 11) }
let!(:card2) { Card.new(:heart, '10', 10) }
let!(:card3) { Card.new(:heart, '9', 9) }
let!(:card4) { Card.new(:diamond, '10', 10) }
let!(:card5) { Card.new(:heart, '8', 8) }
let!(:card6) { Card.new(:diamond, 'Queen', 12) }
let!(:card7) { Card.new(:heart, '3', 3) }
let!(:card8) { Card.new(:diamond, '2', 2) }
let!(:card9) { Card.new(:spade, '2', 2) }
let!(:card10) { Card.new(:spade, '7', 7) }
let!(:deck1) { Deck.new([card1, card2, card5, card8, card9]) }
let!(:deck2) { Deck.new([card3, card4, card6, card7, card10]) }
let!(:player1) { Player.new("Joey", deck1) }
let!(:player2) { Player.new("Josephinie", deck2) }
let!(:turn) { Turn.new(player1, player2) }
let!(:game) { Game.new(player1, player2) }

  it "exists" do
    expect(game).to be_an_instance_of(Game)
  end

  it "has readable attributes" do
    expect(game.player1).to eq(player1)
    expect(game.player2).to eq(player2)
  end

  describe "#start" do
    xit "displays the welcome message" do
      expected_output = <<-EXPECTED
Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{player1.name} and #{player2.name}.
Type 'GO' to start the game!
------------------------------------------------------------------
      EXPECTED

      # expected_output = "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Joey and Josephinie.\nType 'GO' to start the game!\n------------------------------------------------------------------\n"

      actual_output = `ruby pieces_of_war_runner.rb`

      expect(actual_output).to eq(expected_output)
    end

    it "#play_game" do
      game.play_game
    end
  end
end