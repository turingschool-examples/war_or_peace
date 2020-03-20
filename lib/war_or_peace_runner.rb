require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# @card4 = Card.new(:heart, 'King', 13)

# standard_deck = []
# spades = []
# hearts = []
# clubs = []
# diamonds = []
#  # Try making an array of symbols for suits and iterating over them
# suits = [:spades, :hearts, :clubs, :diamonds]
# i = 2
#
#
# while i < 15 do
#   spades << Card.new(:spade, "#{i}", i)
#   hearts << Card.new(:hearts, "#{i}", i)
#   clubs << Card.new(:clubs, "#{i}", i)
#   diamonds << Card.new(:diamonds, "#{i}", i)
#
#   if i == 11
#     spades << Card.new(:spade, "Jack", i)
#     hearts << Card.new(:hearts, "Jack", i)
#     clubs << Card.new(:clubs, "Jack", i)
#     diamonds << Card.new(:diamonds, "Jack", i)
#   elsif i == 12
#     spades << Card.new(:spade, "Queen", i)
#     hearts << Card.new(:hearts, "Queen", i)
#     clubs << Card.new(:clubs, "Queen", i)
#     diamonds << Card.new(:diamonds, "Queen", i)
#   elsif i == 13
#     spades << Card.new(:spade, "King", i)
#     hearts << Card.new(:hearts, "King", i)
#     clubs << Card.new(:clubs, "King", i)
#     diamonds << Card.new(:diamonds, "King", i)
#   else
#     spades << Card.new(:spade, "Ace", i)
#     hearts << Card.new(:hearts, "Ace", i)
#     clubs << Card.new(:clubs, "Ace", i)
#     diamonds << Card.new(:diamonds, "Ace", i)
#   end
#   i += 1
# end
#
# standard_deck << [spades, hearts, clubs, diamonds]
# standard_deck.flatten!
#
# p standard_deck
deck = []
suits = [:spades, :hearts, :clubs, :diamonds]


suits.each do |suit|
  i = 2
  while i < 15 do
    if i < 11
    deck << Card.new(suit, "#{i}", i)
    elsif i == 11
      deck << Card.new(suit, "Jack", i)
    elsif i == 12
      deck << Card.new(suit, "Queen", i)
    elsif i == 13
      deck << Card.new(suit, "King", i)
    elsif i == 14
      deck << Card.new(suit, "Ace", i)
    end
    i += 1
  end
  binding.pry
end

p deck.length
