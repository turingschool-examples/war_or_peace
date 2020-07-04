require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './war_or_peace_runner'

# A few key points to keep in mind as you work on this iteration:
# Use p to display a line of text output to the user
# In this iteration we’ll introduce a new !le called a “runner” – its job is to serve as the main entry point to our program by starting up a new game
#
# Keep in mind that your existing objects should still
# pass all existing tests - nothing that you add in this
# iteration should break anything that functioned in
# iterations 1 or 2!

class GameTest < Minitest::Test
  def test_it_exists
    Game
  end

  # Create 52 cards - standard_deck
  def test_it_has_a_full_deck
    skip
  end

  def test_deck_can_shuffle
    skip
  end

  # Randomally assign the standard_deck to deck_1 and deck_2
  def test_random_assignment_for_player_decks
    skip
  end

  # Assign player_1 and player_2 their decks
  def test_deck_assignment_to_players
    skip
  end

  # Start Method: RESEARCH!!!
    # Welcome to War! (or Peace) This game will be played with 52 cards.
    # The players today are Megan and Aurora.
    # Type 'GO' to start the game!
    # --------------------------------------------------------------
    # Then a user will be able to type GO , and a game will start.
    # The user will then see each turn being played, like this:
    # Turn 1: Megan won 2 cards
    # Turn 2: WAR - Aurora won 6 cards
    # Turn 3: *mutually assured destruction* 6 cards removed from play
    # ...
    # ...
    # ...
    # Turn 9324: Aurora won 2 cards
    # *~*~*~* Aurora has won the game! *~*~*~*
  def test_start_method_begins_game
    skip
  end
end
