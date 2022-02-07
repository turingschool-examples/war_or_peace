require './lib/game'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'

filename = './lib/cards.txt'

generator = CardGenerator.new(filename)

deck1 = Deck.new([])
deck2 = Deck.new([])

generator.cards.shuffle!

deck1.cards << generator.cards[0..25]
deck2.cards << generator.cards[26..51]
deck1.cards.flatten!
deck2.cards.flatten!

player1 = Player.new('Rupert', deck1)
player2 = Player.new('Winston', deck2)

game = Game.new(player1, player2)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are #{player1.name} and #{player2.name}."
p "Type 'GO' to start the game!"

user_input = gets.chomp

if user_input.upcase == 'GO'
  game.start
else
  p 'Invalid input, try again'
end

binding.pry
