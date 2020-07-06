require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

# Call instance of card_generator to create cards
filename = "deck_of_cards.txt"
card_gen = CardGenerator.new(filename)
standard_deck = card_gen.turn_into_array
shuffle_deck = standard_deck.shuffle
deck_1 = Deck.new(shuffle_deck[0..25])
deck_2 = Deck.new(shuffle_deck[26..51])
# p "Player 1 deck"
# p deck_1.cards.length
# p "Player 2 deck"
# p deck_2.cards.length

p "Welcome to War! (or Peace). This game will be played with 52 cards."

p "Player 1, enter your name"
print "> "
temp_player1 = $stdin.gets.chomp
player_1 = Player.new(temp_player1.capitalize, deck_1)

p "Player 2, enter your name"
print "> "
temp_player2 = $stdin.gets.chomp
player_2 = Player.new(temp_player2.capitalize, deck_2)

p "The players today are #{player_1.name} and #{player_2.name}"
p "Type 'GO' to start the game!"
p "-------------------------------------------------"
print "> "
user_input_start = ""
user_input_start = gets.chomp
if user_input_start.upcase == "GO"
  # start game
  p "#{player_1.name} and #{player_2.name} declare WAR!"
  game = Game.new(player_1, player_2)
  game.start
else
  p "Misfire... read the instructions next time :)"
  exit
end
