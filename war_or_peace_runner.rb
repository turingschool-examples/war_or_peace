require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"
require "./lib/game"


standard_deck = StandardDeck.new
cards = standard_deck.cards.shuffle
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..52])

player1 = Player.new("Saryn", deck1)
player2 = Player.new("Dan", deck2)
game = Game.new(player1, player2)
game.start



# Start the game using a new method called start
# This method will need to be included in a class - it is up to you which class to include it in - either existing or ✨new ✨
