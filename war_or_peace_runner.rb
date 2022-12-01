require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
puts "Type 'GO' to start the game!"
puts '------------------------------------------------------------------'

# Start program by creating cards, shuffling them, and splitting into two decks for two players
game.create_cards
game.shuffle_cards
game.split_deck
player1_deck = game.individual_deck[0]
player2_deck = game.individual_deck[1]

# Create new deck instances and add cards to decks
deck1 = Deck.new(player1_deck)
deck2 = Deck.new(player2_deck)

# Create two player instances and assign decks
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck1)

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
puts "Type 'GO' to start the game!"
puts '------------------------------------------------------------------'



# Adding a note here for myself. Enumerator objects were interesting because they can hold arrays but don't necessarily return them unless you use an enumerator method on them. Enumerator objects can also be converted down to arrays with the .to_a method seen above.


# player1 = Player.new("Player One", player1_deck)
# player2 = Player.new("Player Two", player2_deck)
# turn = Turn.new(player1, player2)