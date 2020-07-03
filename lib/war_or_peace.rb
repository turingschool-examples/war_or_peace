require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"
require "./lib/game"

class WarOrPeace

  standard_deck = StandardDeck.new
  cards = standard_deck.cards.shuffle
  deck1 = Deck.new(cards[0..25])
  deck2 = Deck.new(cards[26..52])

  player1 = Player.new("Saryn", deck1)
  player2 = Player.new("Dan", deck2)
  game = Game.new(player1, player2)
  game.start

end
