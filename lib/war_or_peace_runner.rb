require "./card"
require "./deck"
require "./player"
require "./turn"
require "./game"
require "./card_generator"

cards = CardGenerator.new("./cards.txt").cards

shuffled = cards.shuffle
shuffled_deck1 = shuffled.shift(26)
shuffled_deck2 = deck2 = shuffled

deck1 = Deck.new(shuffled_deck1)
deck2 = Deck.new(shuffled_deck2)

player1 = Player.new("Michael", deck1)
player2 = Player.new("Carolyn", deck2)

game1 = Game.new(player1, player2)

game1.start