require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

suits = [:hearts, :diamonds, :spades, :clubs]

value_with_rank = { '2': 2, '3': 3, '4': 4,'5': 5, '6': 6, '7': 7,
'8': 8, '9': 9, '10': 10, 'Jack': 11, 'Queen': 12, 'King': 13,
'Ace': 14 }

cards = []

suits.map do |suit|
  value_with_rank.map do |value, rank|
    cards << Card.new(suit, value, rank)
  end
end

3.times{cards.shuffle!}

deck1 = Deck.new(cards.shift(26))
deck2 = Deck.new(cards.shift(26))

player1 = Player.new("Rick", deck1)
player2 = Player.new("Morty", deck2)

turn = Turn.new(player1, player2)
game = Game.new(turn)

game.start

reply = gets
if reply == "GO" || "Go" || "go"
  game.play
end
