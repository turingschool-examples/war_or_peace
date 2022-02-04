
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

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

RSpec.describe Turn do

  it "creates and shows two players" do
    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
  end

  it "checks default spoils_of_war" do
    expect(turn.spoils_of_war).to eq([])
  end

  it "determines the war type" do
    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it "determines the winner" do
    expect(turn.winner).to eq("No Winner")
  end

  it "collects spoils cards to the winner" do
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([])
  end

  it "rewards spoils to the winner" do

    expect(player1.deck.deck).to eq([card8])
    expect(player2.deck.deck).to eq([card7])
  end


end
