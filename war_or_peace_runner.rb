require './lib/turn.rb'
require './lib/game.rb'
require 'rspec'
require 'pry'


# Found an example of this on Google and had to modify accordingly for our card class
# -------------------------------------
# ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
# suits = %w{Spades Hearts Diamonds Clubs}
# suits.each do |suit|
#   ranks.size.times do |i|
#     stack_of_cards << Card.new( ranks[i], suit, i+1 )
#   end
# end
# -------------------------------------

stack_of_cards = []

values = %w{2 3 4 5 6 7 8 9 10 Jack Queen King Ace} #'%w{}' will turn this line into a string with less steps 
suits = %w{spade heart diamond club}
suits.each do |suit| 
  values.size.times do |i|
    stack_of_cards << Card.new( suit.intern, values[i], i+1 ) #luckily ruby can turn strings into symbols with '.intern'.
  end
end

# Also found this, but it's not as pretty
# -------------------------------------
# stack_of_cards << Card.new("A", "Spades", 1)
# stack_of_cards << Card.new("2", "Spades", 2)
# stack_of_cards << Card.new("3", "Spades", 3)
# stack_of_cards << Card.new("4", "Spades", 4)
# stack_of_cards << Card.new("5", "Spades", 5)
# stack_of_cards << Card.new("6", "Spades", 6)
# stack_of_cards << Card.new("7", "Spades", 7)
# stack_of_cards << Card.new("8", "Spades", 8)
# stack_of_cards << Card.new("9", "Spades", 9)
# stack_of_cards << Card.new("10", "Spades", 10)
# stack_of_cards << Card.new("J", "Spades", 11)
# stack_of_cards << Card.new("Q", "Spades", 12)
# stack_of_cards << Card.new("K", "Spades", 13)

# stack_of_cards << Card.new("A", "Hearts", 1)
# stack_of_cards << Card.new("2", "Hearts", 2)
# stack_of_cards << Card.new("3", "Hearts", 3)
# stack_of_cards << Card.new("4", "Hearts", 4)
# stack_of_cards << Card.new("5", "Hearts", 5)
# stack_of_cards << Card.new("6", "Hearts", 6)
# stack_of_cards << Card.new("7", "Hearts", 7)
# stack_of_cards << Card.new("8", "Hearts", 8)
# stack_of_cards << Card.new("9", "Hearts", 9)
# stack_of_cards << Card.new("10", "Hearts", 10)
# stack_of_cards << Card.new("J", "Hearts", 11)
# stack_of_cards << Card.new("Q", "Hearts", 12)
# stack_of_cards << Card.new("K", "Hearts", 13)

# stack_of_cards << Card.new("A", "Diamonds", 1)
# stack_of_cards << Card.new("2", "Diamonds", 2)
# stack_of_cards << Card.new("3", "Diamonds", 3)
# stack_of_cards << Card.new("4", "Diamonds", 4)
# stack_of_cards << Card.new("5", "Diamonds", 5)
# stack_of_cards << Card.new("6", "Diamonds", 6)
# stack_of_cards << Card.new("7", "Diamonds", 7)
# stack_of_cards << Card.new("8", "Diamonds", 8)
# stack_of_cards << Card.new("9", "Diamonds", 9)
# stack_of_cards << Card.new("10", "Diamonds", 10)
# stack_of_cards << Card.new("J", "Diamonds", 11)
# stack_of_cards << Card.new("Q", "Diamonds", 12)
# stack_of_cards << Card.new("K", "Diamonds", 13)

# stack_of_cards << Card.new("A", "Clubs", 1)
# stack_of_cards << Card.new("2", "Clubs", 2)
# stack_of_cards << Card.new("3", "Clubs", 3)
# stack_of_cards << Card.new("4", "Clubs", 4)
# stack_of_cards << Card.new("5", "Clubs", 5)
# stack_of_cards << Card.new("6", "Clubs", 6)
# stack_of_cards << Card.new("7", "Clubs", 7)
# stack_of_cards << Card.new("8", "Clubs", 8)
# stack_of_cards << Card.new("9", "Clubs", 9)
# stack_of_cards << Card.new("10", "Clubs", 10)
# stack_of_cards << Card.new("J", "Clubs", 11)
# stack_of_cards << Card.new("Q", "Clubs", 12)
# stack_of_cards << Card.new("K", "Clubs", 13)
# -------------------------------------


cards1 = stack_of_cards[0..25].shuffle

cards2 = stack_of_cards[26..52].shuffle

deck1 = Deck.new(cards1)

deck2 = Deck.new(cards2)

player1 = Player.new('Capernicus', deck1)

player2 = Player.new('Warwick', deck2)

game = Game.new(player1, player2)

#binding.pry

puts "Welcome to War! (or Peace) This game will be played with 52 cards."

puts "The players today are Megan and Aurora."

puts "Type 'GO' to start the game!"
print ">"
go = $stdin.gets.chomp

if %w{go Go GO gO}.include?(go)

game.start

else
    puts "You're really missing out!"

end

 