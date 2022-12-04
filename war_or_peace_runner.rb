require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

cards = [Card.new(:heart, '2', 2),
Card.new(:heart, '3', 3),
Card.new(:heart, '4', 4),
Card.new(:heart, '5', 5),
Card.new(:heart, '6', 6),
Card.new(:heart, '7', 7),
Card.new(:heart, '8', 8),
Card.new(:heart, '9', 9),
Card.new(:heart, '10', 10),
Card.new(:heart, 'Jack', 11),
Card.new(:heart, 'Queen', 12),
Card.new(:heart, 'King', 13),
Card.new(:heart, 'Ace', 14),
Card.new(:spade, '2', 2),
Card.new(:spade, '3', 3),
Card.new(:spade, '4', 4),
Card.new(:spade, '5', 5),
Card.new(:spade, '6', 6),
Card.new(:spade, '7', 7),
Card.new(:spade, '8', 8),
Card.new(:spade, '9', 9),
Card.new(:spade, '10', 10),
Card.new(:spade, 'Jack', 11),
Card.new(:spade, 'Queen', 12),
Card.new(:spade, 'King', 13),
Card.new(:spade, 'Ace', 14),
Card.new(:diamond, '2', 2),
Card.new(:diamond, '3', 3),
Card.new(:diamond, '4', 4),
Card.new(:diamond, '5', 5),
Card.new(:diamond, '6', 6),
Card.new(:diamond, '7', 7),
Card.new(:diamond, '8', 8),
Card.new(:diamond, '9', 9),
Card.new(:diamond, '10', 10),
Card.new(:diamond, 'Jack', 11),
Card.new(:diamond, 'Queen', 12),
Card.new(:diamond, 'King', 13),
Card.new(:diamond, 'Ace', 14),
Card.new(:ace, '2', 2),
Card.new(:ace, '3', 3),
Card.new(:ace, '4', 4),
Card.new(:ace, '5', 5),
Card.new(:ace, '6', 6),
Card.new(:ace, '7', 7),
Card.new(:ace, '8', 8),
Card.new(:ace, '9', 9),
Card.new(:ace, '10', 10),
Card.new(:ace, 'Jack', 11),
Card.new(:ace, 'Queen', 12),
Card.new(:ace, 'King', 13),
Card.new(:ace, 'Ace', 14)]


# cards.shuffle

# half_1 = []
# half_2 = []

# 26.times do
#     pulled_cards = cards.sample
#     half_1 << pulled_cards
#     cards.delete(pulled_cards)
# end

# 26.times do
#     leftover = cards.sample
#     half_2 << leftover
#     cards.delete(leftover)
# end

# deck1 = Deck.new(half_1)
# deck2 = Deck.new(half_2)
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
# turn = Turn.new(player1, player2)

game = Game.new(cards)
game.start
