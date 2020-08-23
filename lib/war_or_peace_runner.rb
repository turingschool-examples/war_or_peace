require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# 1. Create a standard 52 card deck1 DONE
# 2. Randomly put 26 cards into two decks DONE
# 3. Create two players with the decks I crreated DONE

# Welcome to War! (or Peace) This game will be played with 52 cards.
# The players today are Megan and Aurora.
# Type 'GO' to start the game!

# 4. Make a start method to start the game.
#     - 'GO' received, initiates the start method
#     - start method, <= from Game class?
#     - start method function:
# =>    - leads into turn.type, or is another step req?
# User will see the game as below
# Turn 1: Megan won 2 cards
# Turn 2: WAR - Aurora won 6 cards
# Turn 3: *mutually assured destruction* 6 cards removed from play
# ...
# ...
# ...
# *~*~*~* Aurora has won the game! *~*~*~*
# Turn 9324: Aurora won 2 cards
#
# Use Turn method to count how many turns or rounds have been played?
# need to cound the turns, max 1,000,000 rounds if no winner, winner =
# holding 52 cards,
#
deck1 = []
deck2 = []
deck  = Deck.new
deck.generate_standard_deck
deck.randomize_deck
deck.split_deck(deck1, deck2)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
p 'The players today are Megan and Aurora.'
p 'Type "GO" to start the game!'
p '------------------------------------------------------------------'
