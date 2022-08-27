require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/game"
require "./lib/card_generator"


# Create the standard 52 cards
all_cards = CardGenerator.new("cards.txt").cards

# shuffle 3 times
shuffled_once = all_cards.shuffle
shuffled_twice = shuffled_once.shuffle
shuffled_thrice = shuffled_twice.shuffle

# split cards into two Decks
cards1 = shuffled_thrice[0..25]
cards2 = shuffled_thrice[26..51]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

# create two players 
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

# play game
print "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------\n"
user_input = gets.chomp 
count = 0
until user_input == "GO" || count == 3 do 
  print "\n"
  count += 1
  user_input = gets.chomp 
end 

if user_input == "GO"
  game = Game.new(player1, player2)
  game.start
end 
