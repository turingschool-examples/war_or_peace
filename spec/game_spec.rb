require 'stringio'
require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)

    expect(game).to be_an_instance_of(Game)
  end

  it 'hashas readable attributes' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)

    expect(game.current_turn).to eq(turn)
    expect(game.turn_count).to eq(1)
  end

  #
  xit 'can start a game' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)
    game.start

    # allow($stdin).to recieve(:gets).and_retrun('go')
    # user_input = $stdin.gets
    # expect(user_input).to eq('go')
  end

  it 'can run a game' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)
 
    game.run
    expect(turn.turn_type).to eq(:basic)
    expect(turn.turn_winner).to eq(player_1)
    expect(deck_1.card_list).to eq([card_1, card_2])
    expect(deck_2.card_list).to eq([])
  end

  it 'will print turn updates' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)

    game.run
    expect(game.turn_return).to eq("Turn 1: Basic - Megan wins 2 cards.")
  end

  it 'will end game when one player has no cards' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    deck_1 = Deck.new([card_1])
    deck_2 = Deck.new([card_2])
    player_1 = Player.new('Megan', deck_1)
    player_2 = Player.new('Aurora', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(turn)

    game.run
    game.the_end?
    expect(game.current_turn.turn_winner).to eq(player_1)
  end
end