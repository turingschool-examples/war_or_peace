require "./lib/card"
require "./lib/deck"
require "./lib/player"

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
deck = Deck.new([card1, card2, card3])
player = Player.new('Clarisa', deck)
p player.has_lost?
p player.deck.remove_card
p player.deck 
p player.has_lost?
p player.deck.remove_card
p player.deck 
p player.has_lost?
p player.deck.remove_card
p player.deck 
p player.has_lost?
