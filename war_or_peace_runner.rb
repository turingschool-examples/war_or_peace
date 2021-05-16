require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'


card_generator = CardGenerator.new('cards.txt')
deck1 = Deck.new(card_generator.deck_one)
deck2 = Deck.new(card_generator.deck_two)

player1 = Player.new('Billy', deck1)
player2 = Player.new('Lauren', deck2)

turn = Turn.new(player1, player2)
game = Game.new(turn)

game.start
