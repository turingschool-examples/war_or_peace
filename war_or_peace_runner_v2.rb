require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
game = Game.new(turn)

game.deal_cards
game.ask_for_input
game.start
