require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do

  it 'determining correct winner when player1 starts with high card' do

    cards1 = [Card.new(:heart, '7', 7)]
    cards2 = [Card.new(:spade, '6', 6)]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output("Turn 1: Megan won 2 cards\n*~* Megan has won the game! *~*\n").to_stdout
  end

  it 'determining correct winner when player2 starts with high card' do

    cards1 = [Card.new(:heart, '6', 6)]
    cards2 = [Card.new(:spade, '7', 7)]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output("Turn 1: Aurora won 2 cards\n*~* Aurora has won the game! *~*\n").to_stdout
  end

  it 'determining correct output when turn 1 is war and player1 is winner' do
    cards1 = [Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 8)]
    cards2 = [Card.new(:spade, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 7)]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output("Turn 1: WAR - Megan won 6 cards\n*~* Megan has won the game! *~*\n").to_stdout
  end

  it 'determining correct output when turn 1 is war and player2 is winner' do
    cards1 = [Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 7)]
    cards2 = [Card.new(:spade, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 8)]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output(
      <<~EXPECTED
        Turn 1: WAR - Aurora won 6 cards\n*~* Aurora has won the game! *~*
      EXPECTED
    ).to_stdout
  end

  it 'determining correct output when turn 3 is MAD' do
    cards1 = [
      Card.new(:heart, '8', 8),
      Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),
      Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 7)
    ]
    cards2 = [
      Card.new(:heart, '7', 7),
      Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '8', 8),
      Card.new(:heart, '7', 7),Card.new(:heart, '7', 7),Card.new(:heart, '7', 7)
    ]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output(
      <<~EXPECTED
        Turn 1: Megan won 2 cards
        Turn 2: WAR - Aurora won 6 cards
        Turn 3: *MAD* 6 cards removed from play
        Turn 4: Megan won 2 cards
        Turn 5: *MAD* 6 cards removed from play
        *~* Aurora has won the game! *~*
      EXPECTED
    ).to_stdout
  end
end
