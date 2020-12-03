require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'

card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)


text = <<HEREDOC
Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------
HEREDOC

puts text

input = gets.chomp

while input != "GO"
  puts "Oops, your flipper must have slipped, please try again."
  input = gets.chomp
end
