require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require 'pry'

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

RSpec.describe Turn do
  it "exists" do

    expect(turn).to be_an_instance_of(Turn)
  end

  it "returns empty array for spoils_of_war" do

    expect(turn.spoils_of_war).to eq []
  end

  it "returns :basic for turn type" do

    expect(turn.type).to eq :basic
  end

  it "returns the winner for the turn" do
    # binding.pry
    expect(turn.winner).to eq player1
  end

  # it ""

  # it "returns spoils of war for turn winner" do
  #   expect(turn.spoils_of_war).to eq [card1, card3]
  # end

end
