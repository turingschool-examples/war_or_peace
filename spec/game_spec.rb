require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  before do
    # player1 name, player2 name, base deck
    @game = Game.new('Bob', 'Jeff', Deck.new([]))
    @tuple_deck = Deck.new([Card.new(:foo, 'Bar', 1), Card.new(:foo, 'Bar', 1)])
  end

  it "exists" do
    expect(@game).to be_an_instance_of(Game)
  end

  it "has readable attributes" do
    expect(@game.player1.name).to eq('Bob')
    expect(@game.player2.name).to eq('Jeff')
    expect(@game.base_deck).to be_an_instance_of(Deck)
  end

  it "can provide default base deck of 52 cards" do
    default_base_deck = @game.default_base_deck
    expect(default_base_deck.cards.length).to eq(52)
  end

  it "can be assigned base deck" do
    game = Game.new('Bob', 'Jeff', Deck.new([]))
    expect(game.base_deck.cards.length).to eq(0)
    game.assign_base_deck(game.default_base_deck)
    expect(game.base_deck.cards.length).to eq(52)
  end

  it "starts" do
    game = Game.new('Bob', 'Jeff')
    game.assign_base_deck(game.default_base_deck)
    game.base_deck.cards.shuffle!
    game.start
    expect(game.has_started?).to eq(true)
  end


  it "can be won" do
    game = Game.new('Bob', 'Jeff')
    instant_game_over_deck = @tuple_deck
    game.assign_base_deck(instant_game_over_deck)
    game.start
    expect(game.game_over?).to eq(true)
  end

  it "can produce MAD turns" do
    game = @game
    mad_deck = Deck.new([])
    for i in 1..52 do
      mad_deck.add_card_to_bottom(Card.new(:foo, 'Nuke', 9001))
    end
    game.assign_base_deck(mad_deck)
    game.start
    expect(game.num_of_mads > 0).to eq(true)
  end

  it "can be played with a starting deck of two cards" do
    game = @game
    game.assign_base_deck(@tuple_deck)
    game.start
    expect(game.has_started?).to eq(true)
  end

end
