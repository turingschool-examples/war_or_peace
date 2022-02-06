require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require './lib/card_generator'
require 'pry'

filename = './data/cards.csv'
unshuffled_deck = CardGenerator.new(filename).cards

shuffled_deck = unshuffled_deck.shuffle

deck1 = []
deck2 = []

26.times do
  deck1 << shuffled_deck.shift
  deck2 << shuffled_deck.shift
end

player1_deck = Deck.new(deck1)
player2_deck = Deck.new(deck2)

player1 = Player.new('Robot 1', player1_deck)
player2 = Player.new('Robot 2', player2_deck)

game = Game.new(player1, player2)

game.start
