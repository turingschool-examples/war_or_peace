###################
# Player Interaction Pattern
###################

# require './lib/card'
# require './lib/deck'
# require './lib/player'

# card1 = Card.new(:diamond, 'Queen', 12)
# p card1
# puts

# card2 = Card.new(:spade, '3', 3)
# p card2
# puts

# card3 = Card.new(:heart, 'Ace', 14) 
# p card3
# puts

# p deck = Deck.new([card1, card2, card3])
# puts

# player = Player.new('Clarisa', deck)
# p player
# puts

# p player.name
# puts

# p player.deck
# puts

# p player.has_lost?
# puts

# p player.deck.remove_card
# puts

# p player.has_lost?
# puts

# p player.deck.remove_card
# puts

# p player.has_lost?
# puts

# p player.deck.remove_card
# puts

# p player.has_lost?
# puts

# p player.deck
# puts

# ###################
# # Turn Type Basic
# # Interaction Pattern
# ###################

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

card1 = Card.new(:heart, 'Jack', 11)
p card1
puts

card2 = Card.new(:heart, '10', 10)  
p card2
puts

card3 = Card.new(:heart, '9', 9) 
p card3
puts

card4 = Card.new(:diamond, 'Jack', 11) 
p card4
puts

card5 = Card.new(:heart, '8', 8)
p card5
puts

card6 = Card.new(:diamond, 'Queen', 12) 
p card6
puts

card7 = Card.new(:heart, '3', 3)  
p card7
puts

card8 = Card.new(:diamond, '2', 2)
p card8
puts

deck1 = Deck.new([card1, card2, card5, card8]) 
p deck1
puts

deck2 = Deck.new([card3, card4, card6, card7])  
p deck2
puts

# player1 = Player.new("Megan", deck1)
# p player1
# puts

# player2 = Player.new("Aurora", deck2) 
# p player2
# puts

# turn = Turn.new(player1, player2)
# p turn
# puts

# p turn.player1
# puts

# p turn.player2
# puts

# p turn.spoils_of_war 
# puts

# p turn.type
# puts

# p winner = turn.winner
# puts

# turn.pile_cards
# p turn.spoils_of_war

# turn.award_spoils(winner)

# p player1.deck
# puts

# p player2.deck
# puts