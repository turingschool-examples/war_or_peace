require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
  it "exists" do
    game = Game.new('Aaron', 'Beth')
    expect(game).to be_an_instance_of(Game)
  end

  it "makes deck" do
    game = Game.new('Aaron', 'Beth')
    game.make_deck
    expect(game.full_deck.length).to eq(52)
  end

  it "splits deck" do
    game = Game.new('Aaron', 'Beth')
    game.make_deck
    game.split_deck
    expect(game.deck1.cards.length).to eq(26)
    expect(game.deck2.cards.length).to eq(26)
  end

  it "starts" do
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
    player1 = Player.new('p1_name', deck1)
    player2 = Player.new('p2_name', deck2)
    game = Game.new(player1, player2)
    game.start
    expect(game).to be_an_instance_of(Game)
  end
end
