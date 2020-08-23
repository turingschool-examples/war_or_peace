require "minitest/autorun"
require "minitest/pride"
require './lib/card'
require './lib/deck'
require "./lib/player"
require "./lib/turn"
require "./lib/small_turn"
require "./lib/game"

class GameTest < Minitest::Test
  def test_it_exists
    standard_deck = [
      card1 = Card.new(:heart, "Jack", 11),
      card2 = Card.new(:heart, "10", 10),
      card3 = Card.new(:heart, "9", 9),
      card4 = Card.new(:diamond, "Jack", 11),
      card5 = Card.new(:heart, "8", 8),
      card6 = Card.new(:diamond, "Queen", 12),
      card7 = Card.new(:heart, "3", 3),
      card8 = Card.new(:diamond, "2", 2)
    ]

    shuffled_standard_deck = standard_deck.shuffle
    shuffled1 = []
    shuffled2 = []
    4.times do
      shuffled1 << shuffled_standard_deck.shift
      shuffled2 << shuffled_standard_deck.shift
    end
    deck1 = Deck.new(shuffled1)
    deck2 = Deck.new(shuffled2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    assert_instance_of Game, game
  end

  def test_a_short_game_will_end
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start
    # require "pry"; binding.pry
    assert_equal player2, game.game_winner
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", game.game_ended
  end

  def test_a_longer_game
    # skip
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    card9 = Card.new(:spade, "7", 7)
    card10 = Card.new(:spade, "3", 3)
    card11 = Card.new(:club, "King", 13)
    card12 = Card.new(:club, "Ace", 14)
    standard_deck = [card1, card2, card3, card4, card5, card6, card7, card8,
      card9, card10, card11, card12]

    shuffled_standard_deck = standard_deck.shuffle
    shuffled1 = []
    shuffled2 = []
    6.times do
      shuffled1 << shuffled_standard_deck.shift
      shuffled2 << shuffled_standard_deck.shift
    end
    deck1 = Deck.new(shuffled1)
    deck2 = Deck.new(shuffled2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
# require "pry"; binding.pry  ### No method error coming up because its calling
    ##  on @player1_third_card in turn, which I'm guessing has been taken and
    ##  doesn't exist (hence nil)
    game.start
    game.game_ended
    puts game.game_winner
    # require "pry"; binding.pry
    000
  end

  def test_a_lot_of_cards
    standard_deck = [
      card1 = Card.new(:diamond, "2", 2),
      card2 = Card.new(:diamond, "3", 3),
      card3 = Card.new(:diamond, "4", 4),
      card4 = Card.new(:diamond, "5", 5),
      card5 = Card.new(:diamond, "6", 6),
      card6 = Card.new(:diamond, "7", 7),
      card7 = Card.new(:diamond, "8", 8),
      card8 = Card.new(:diamond, "9", 9),
      card9 = Card.new(:diamond, "10", 10),
      card10 = Card.new(:diamond, "Jack", 11),
      card11 = Card.new(:diamond, "Queen", 12),
      card12 = Card.new(:diamond, "King", 13),
      card13 = Card.new(:diamond, "Ace", 14),
      card14 = Card.new(:heart, "2", 2),
      card15 = Card.new(:heart, "3", 3),
      card16 = Card.new(:heart, "4", 4),
      card17 = Card.new(:heart, "5", 5),
      card18 = Card.new(:heart, "6", 6),
      card19 = Card.new(:heart, "7", 7),
      card20 = Card.new(:heart, "8", 8),
      card21 = Card.new(:heart, "9", 9),
      card22 = Card.new(:heart, "10", 10),
      card23 = Card.new(:heart, "Jack", 11),
      card24 = Card.new(:heart, "Queen", 12),
      card25 = Card.new(:heart, "King", 13),
      card26 = Card.new(:heart, "Ace", 14),
      card27 = Card.new(:club, "2", 2),
      card28 = Card.new(:club, "3", 3),
      card29 = Card.new(:club, "4", 4),
      card30 = Card.new(:club, "5", 5),
      card31 = Card.new(:club, "6", 6),
      card32 = Card.new(:club, "7", 7),
      card33 = Card.new(:club, "8", 8),
      card34 = Card.new(:club, "9", 9),
      card35 = Card.new(:club, "10", 10),
      card36 = Card.new(:club, "Jack", 11),
      card37 = Card.new(:club, "Queen", 12),
      card38 = Card.new(:club, "King", 13),
      card39 = Card.new(:club, "Ace", 14),
      card40 = Card.new(:spade, "2", 2),
      card41 = Card.new(:spade, "3", 3),
      card42 = Card.new(:spade, "4", 4),
      card43 = Card.new(:spade, "5", 5),
      card44 = Card.new(:spade, "6", 6),
      card45 = Card.new(:spade, "7", 7),
      card46 = Card.new(:spade, "8", 8),
      card47 = Card.new(:spade, "9", 9),
      card48 = Card.new(:spade, "10", 10),
      card49 = Card.new(:spade, "Jack", 11),
      card50 = Card.new(:spade, "Queen", 12),
      card51 = Card.new(:spade, "King", 13),
      card52 = Card.new(:spade, "Ace", 14)
    ]
    shuffled1 = []
    shuffled2 = []
    shuffled_standard_deck = standard_deck.shuffle
    26.times do
      shuffled1 << shuffled_standard_deck.shift
      shuffled2 << shuffled_standard_deck.shift
    end
    deck1 = Deck.new(shuffled1)
    deck2 = Deck.new(shuffled2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
# require "pry"; binding.pry  ### No method error coming up because its calling
    ##  on @player1_third_card in turn, which I'm guessing has been taken and
    ##  doesn't exist (hence nil)
    game.start
    game.game_ended
    puts game.game_winner
    # require "pry"; binding.pry
    000
  end
end
