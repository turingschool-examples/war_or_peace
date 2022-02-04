require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


deck = Deck.new
deck.create_cards
deck.cards.shuffle!

deck1 = deck.cards[0..25]
deck2 = deck.cards[26..51]

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

player1.deck.each do |card|
  puts card.value
end
# puts player2.deck
