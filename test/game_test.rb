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
    card_5 = Card.new(:heart, 'Eight', 8)
    card_6 = Card.new(:club, 'Queen', 12)
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
  # def test_start_initial_message
  #   card_1 = Card.new(:club, 'Jack', 11)
  #   card_2 = Card.new(:heart, 'Seven', 7)
  #   card_3 = Card.new(:spade, 'Two', 2)
  #   card_4 = Card.new(:diamond, 'King', 13)
  #   card_5 = Card.new(:heart, 'Eight', 12)
  #   card_6 = Card.new(:club, 'Queen', 8)
  #   card_7 = Card.new(:spade, 'Ace', 14)
  #   card_8 = Card.new(:diamond, 'Three', 3)
  #   deck_1 = Deck.new([card_1, card_3, card_5, card_7])
  #   deck_2 = Deck.new([card_2, card_4, card_6, card_8])
  #   player_1 = Player.new('Priya', deck_1)
  #   player_2 = Player.new('Ricky', deck_2)
  #   turn = Turn.new(player_1, player_2)
  #   game = Game.new(player_1, player_2)
  #   # game.start
  #   # assert_equal [], game.start
  #   # require 'pry'; binding.pry
  #   # Welcome message working
  #   # Player names working
  #   # User input variable working
  #   # If conditional working
  #   # if else statement works and starts user over
  #   # if statement needs a new method for playing the game
  # end

  def test_user_start_plays_the_game
    card_1 = Card.new(:club, 'Two', 2)
    card_2 = Card.new(:club, 'Three', 3)
    card_3 = Card.new(:club, 'Four', 4)
    card_4 = Card.new(:club, 'Five', 5)
    card_5 = Card.new(:club, 'Six', 6)
    card_6 = Card.new(:club, 'Seven', 7)
    card_7 = Card.new(:club, 'Eight', 8)
    card_8 = Card.new(:club, 'Nine', 9)
    card_9 = Card.new(:club, 'Ten', 10)
    card_10 = Card.new(:club, 'Jack', 11)
    card_11 = Card.new(:club, 'Queen', 12)
    card_12 = Card.new(:club, 'King', 13)
    card_13 = Card.new(:club, 'Ace', 14)
    card_14 = Card.new(:diamond, 'Two', 2)
    card_15 = Card.new(:diamond, 'Three', 3)
    card_16 = Card.new(:diamond, 'Four', 4)
    card_17 = Card.new(:diamond, 'Five', 5)
    card_18 = Card.new(:diamond, 'Six', 6)
    card_19 = Card.new(:diamond, 'Seven', 7)
    card_20 = Card.new(:diamond, 'Eight', 8)
    card_21 = Card.new(:diamond, 'Nine', 9)
    card_22 = Card.new(:diamond, 'Ten', 10)
    card_23 = Card.new(:diamond, 'Jack', 11)
    card_24 = Card.new(:diamond, 'Queen', 12)
    card_25 = Card.new(:diamond, 'King', 13)
    card_26 = Card.new(:diamond, 'Ace', 14)
    card_27 = Card.new(:heart, 'Two', 2)
    card_28 = Card.new(:heart, 'Three', 3)
    card_29 = Card.new(:heart, 'Four', 4)
    card_30 = Card.new(:heart, 'Five', 5)
    card_31 = Card.new(:heart, 'Six', 6)
    card_32 = Card.new(:heart, 'Seven', 7)
    card_33 = Card.new(:heart, 'Eight', 8)
    card_34 = Card.new(:heart, 'Nine', 9)
    card_35 = Card.new(:heart, 'Ten', 10)
    card_36 = Card.new(:heart, 'Jack', 11)
    card_37 = Card.new(:heart, 'Queen', 12)
    card_38 = Card.new(:heart, 'King', 13)
    card_39 = Card.new(:heart, 'Ace', 14)
    card_40 = Card.new(:spade, 'Two', 2)
    card_41 = Card.new(:spade, 'Three', 3)
    card_42 = Card.new(:spade, 'Four', 4)
    card_43 = Card.new(:spade, 'Five', 5)
    card_44 = Card.new(:spade, 'Six', 6)
    card_45 = Card.new(:spade, 'Seven', 7)
    card_46 = Card.new(:spade, 'Eight', 8)
    card_47 = Card.new(:spade, 'Nine', 9)
    card_48 = Card.new(:spade, 'Ten', 10)
    card_49 = Card.new(:spade, 'Jack', 11)
    card_50 = Card.new(:spade, 'Queen', 12)
    card_51 = Card.new(:spade, 'King', 13)
    card_52 = Card.new(:spade, 'Ace', 14)
    standard_deck = [card_1, card_2, card_3, card_4, card_5, card_6, card_7,
      card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15,
      card_16, card_17, card_18, card_19, card_20, card_21, card_22, card_23,
      card_24, card_25, card_26, card_27, card_28, card_29, card_30, card_31,
      card_32, card_33, card_34, card_35, card_36, card_37, card_38, card_39,
      card_40, card_41, card_42, card_43, card_44, card_45, card_46, card_47,
      card_48, card_49, card_50, card_51, card_52]
    # shuffle_deck = standard_deck.shuffle
    # deck_1 = Deck.new(shuffle_deck[0..25])
    # deck_2 = Deck.new(shuffle_deck[26..51])
    deck_1 = Deck.new(standard_deck[0..25])
    deck_2 = Deck.new(standard_deck[26..51])
    player_1 = Player.new('Priya', deck_1)
    player_2 = Player.new('Ricky', deck_2)
    game = Game.new(player_1, player_2)
    require 'pry'; binding.pry
    # Hmmm... until method seems okay,
    # however, the if conditional isn't quite working
    # Figured it out, my if conditional is fine
    # tested with test file and pry, it should work
    # So, there must be something wrong with until
    # Which means something might be wrong with my player class
    # Realized w/ .has_lost? the return was simply a string
    # The string was fine for testing, but it doesn't help
    # the computer understand what i want
    # Which is a boolean!!!
    # Must go and update my player file.
    # FIXED! Looks like it is working.
    # Time to polish and test edge cases
    # Also - better go test Player class since I made edits

    # FOUND ISSUE: my user input for name isn't connecting to player class parameter
    # May need to update get chomp to runner instead

    # FOUND SECOND ISSUE: Though - this could be due to lack of a full deck...
    # You know what, let me add my full deck and go from there.

    # After updating (nuking) game class
    # Retesting!

    # Was working, found many errors when testing the game during run
    # Found edge case, what happens when deck empties

    # Looks like I may have finally gotten it working! Time to test again :)
  end

end
