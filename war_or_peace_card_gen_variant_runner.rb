require './lib/card_generator'
require './lib/game'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

cards1 = CardGenerator.new("deck1.txt")
cards2 = CardGenerator.new("deck2.txt")

cards1.read
cards2.read

deck1 = Deck.new(cards1.cards)
deck2 = Deck.new(cards2.cards)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turn = Turn.new(player1, player2)

game = Game.new(turn)
game.start