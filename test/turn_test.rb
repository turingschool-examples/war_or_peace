# Write out test script
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
# Forgot to add this require
require './lib/turn'

class TurnTest < Minitest::Test

  # First test to see if it exists
  # Write the class slowly as you write this test
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
    # require 'pry'; binding.pry
    # pry showed the error is in the Turn below...
    # OMG... I think I forgot to link the Class file to the test file!


    # current (correct) error because I haven't begun writing the Turn class
    # hmmm... new error after creating class...

    # testing with pry
    # require 'pry'; binding.pry

    turn = Turn.new(player_1, player_2)
    # SUCCESS!!!
  end

  # Write a test to check two players
  # Write a test to check if attributes are readable
  # Write a test to check type method
  # Write a test to check winner method
  # Write a test to check pile_cards method
  # Write a test to check award_spoils method
end
