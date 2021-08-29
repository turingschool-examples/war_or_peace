require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "has attributes" do
    game = Game.new
    # deck1 = Deck.new(half_deck1)
    # deck2 = Deck.new(half_deck2)
    expect(game.player1.name).to eq("Megan")
    expect(game.player2.name).to eq("Aurora")
    expect(game.deck.cards.size).to eq(52)
  end

  it "splits the deck into 2 decks" do
    game = Game.new

    expect(game.deck1.cards.size).to eq(26)
    expect(game.deck2.cards.size).to eq(26)
  end

  it "tests which player is the winner" do
    game = Game.new
  end
end
