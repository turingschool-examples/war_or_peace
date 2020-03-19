require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

fulldeck = []
suits = [:spade, :club, :heart, :diamond]
suits.each do |suit|
  val = 2
  while val <= 10
    card = Card.new(suit, val.to_s, val)
    fulldeck << card
    val += 1
  end
  cardJ = Card.new(suit, "Jack", 11)
  fulldeck << cardJ
  cardQ = Card.new(suit, "Queen", 12)
  fulldeck << cardQ
  cardK = Card.new(suit, "King", 13)
  fulldeck << cardK
  cardA = Card.new(suit, "Ace", 14)
  fulldeck << cardA
end

shuffled_deck = fulldeck.shuffle
deck1 = Deck.new(shuffled_deck.shift(26))
deck2 = Deck.new(shuffled_deck)

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
print "Who is player 1? "
p1name = gets.chomp
print "Who is player 2? "
p2name = gets.chomp
player1 = Player.new(p1name, deck1)
player2 = Player.new(p2name, deck2)
puts "The players today are #{player1.name} and #{player2.name}."
puts "Type 'GO' to start the game!"
puts "----------------------------"
go = gets.chomp
require "pry"; binding.pry
