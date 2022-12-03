require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

# Create 52 Cards and shuffle
deck = []
suits = [:club, :diamond, :heart, :spade]

4.times do |suit|
    9.times do |value|    
        deck << Card.new(suits[suit], (value + 2).to_s, value + 2)
    end

    deck << Card.new(suits[suit], "Jack", 11)
    deck << Card.new(suits[suit], "Queen", 12)
    deck << Card.new(suits[suit], "King", 13)
    deck << Card.new(suits[suit], "Ace", 14)
end

deck.shuffle!

# Create two players
player1 = Player.new("Megan", Deck.new(deck.shift(26)))
player2 = Player.new("Aurora", Deck.new(deck))

# Create game Start
game = Game.new(player1, player2)

# Print welcome message and prompt user to start game
puts
puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are #{player1.name} and #{player2.name}"
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
input = gets.chomp!

# If user input is 'GO' start game, otherwise prompt for valid input
until input == "GO"
    puts "Please enter 'GO' to start!"
    input = gets.chomp!
end

# Start game and print results
p game.start

    
