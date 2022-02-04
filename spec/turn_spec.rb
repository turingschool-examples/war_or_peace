require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:heart, 'Jack', 10)
    card2 = Card.new(:heart, '10', 9)
    card3 = Card.new(:heart, '9', 8)
    card4 = Card.new(:diamond, 'Jack', 10)
    card5 = Card.new(:heart, '8', 7)
    card6 = Card.new(:diamond, 'Queen', 11)
    card7 = Card.new(:heart, '3', 2)
    card8 = Card.new(:diamond, '2', 1)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it "checks the type of turn" do
    card1 = Card.new(:heart, 'Jack', 10)
    card2 = Card.new(:heart, '10', 9)
    card3 = Card.new(:heart, '9', 8)
    card4 = Card.new(:diamond, 'Jack', 10)
    card5 = Card.new(:heart, '8', 7)
    card6 = Card.new(:diamond, 'Queen', 11)
    card7 = Card.new(:heart, '3', 2)
    card8 = Card.new(:diamond, '2', 1)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:basic)
  end
end
