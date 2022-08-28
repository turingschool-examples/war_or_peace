require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

card_generator = CardGenerator.new('cards.txt')
full_deck = card_generator.cards
full_deck.shuffle!

deck1 = Deck.new
deck2 = Deck.new

26.times do 
  deck1.cards << full_deck.shift
  deck2.cards << full_deck.shift
end

player1 = Player.new('John', deck1)
player2 = Player.new('Ringo', deck2)

game = Game.new(player1, player2)
game.start