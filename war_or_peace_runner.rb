require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

suits = [:heart, :diamond, :spade, :club]
values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = (1..14).to_a

# cards = Hash.new
# suits.each do |suit|
#   cards.store(suit,
#                   values.each { |value| value } +
#                   ranks.each { |rank| rank } )
#                 end

#making a change here to show branch change
