require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

# Create and shuffle a deck of cards.
card_generator = CardGenerator.new('cards.txt')
full_deck = card_generator.cards
full_deck.shuffle!

# Create 2 player decks from the shuffled deck
deck1 = Deck.new
deck2 = Deck.new

26.times do 
  deck1.cards << full_deck.shift
  deck2.cards << full_deck.shift
end

# Create 2 players utilizing the 2 player decks
player1 = Player.new('John', deck1)
player2 = Player.new('Ringo', deck2)

# Create and start a game with the 2 players.
game = Game.new(player1, player2)
game.start