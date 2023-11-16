require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/game"

deck = Deck.new([])


suits = [:hearts, :diamonds, :spades, :clubs]
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

suits.each do |suit|
  values.each_with_index do |value, index|
    rank = ranks[index]
    card = Card.new(suit, value, rank)
    deck.add_card(card)
  end
end

deck.cards.shuffle!

# cards could be turned into a class and called on in the runner

deck1 = Deck.new(deck.cards[0..25])
deck2 = Deck.new(deck.cards[26..51])
player1 = Player.new("Joey", deck1)
player2 = Player.new("Josephinie", deck2)
game = Game.new(player1, player2)

game.start


