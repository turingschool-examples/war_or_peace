
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

deck1.cards << generator.cards[0..25]
deck2.cards << generator.cards[26..51]
deck1.cards.flatten!
deck2.cards.flatten!

player1 = Player.new('Rupert', deck1)
player2 = Player.new('Winston', deck2)

turn = Turn.new(player1, player2)


turn.start
