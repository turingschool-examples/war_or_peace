require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test

  # Test game class
  def test_it_exists
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 12)
    card_6 = Card.new(:club, 'Queen', 8)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(player_1, player_2)
    # require 'pry'; binding.pry
    # Some functionality
    # Still trying to understand setup
    # Can't get it....
    assert_instance_of Game, game
  end

  # Test start method
  def test_start_initial_message
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 12)
    card_6 = Card.new(:club, 'Queen', 8)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(player_1, player_2)
    # game.start
    # assert_equal [], game.start
    # require 'pry'; binding.pry
    # Welcome message working
    # Player names working
    # User input variable working
    # If conditional working
    # if else statement works and starts user over
    # if statement needs a new method for playing the game
  end

  def test_user_start_plays_the_game
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    card_5 = Card.new(:heart, 'Eight', 12)
    card_6 = Card.new(:club, 'Queen', 8)
    card_7 = Card.new(:spade, 'Ace', 14)
    card_8 = Card.new(:diamond, 'Three', 3)
    deck_1 = Deck.new([card_1, card_3, card_5, card_7])
    deck_2 = Deck.new([card_2, card_4, card_6, card_8])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(player_1, player_2)
    require 'pry'; binding.pry
    # game.start
    # game.user_start
  end

end
