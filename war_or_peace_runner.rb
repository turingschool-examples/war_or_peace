require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'   #binding.pry

# p "Welcome to War! (or Peace) This game will be played with 52 cards."
# p "The players today are Megan and Aurora."
# p "Type 'GO' to start the game!"
# p "------------------------------------------------------------------"
#
# start = gets.chomp
#   if start == "GO"
#       Game.new.start
#   else
#     p "Please type 'GO' to start!"
#   end

# Create 52 Cards (A standard deck)
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"] #values = card name
suits = ["Hearts", "Spades", "Diamonds", "Clubs"]
deck1 = Deck.new([])
deck2 = Deck.new([])

# deck1 = deck1.cards.shuffle #this will shovel the cards into 2 separate decks to try to get a random sample
# deck2 = deck2.cards.shuffle
suits.each do |suit| #suits are the suits (duh, hearts/spades/diamonds/clubs)
  13.times do |i| #<- i is index position of value and i is a variable here & anytime you set a thing = to something the thing is a variable
    #- values.length - returns an integer--.times is a method on integers that creates a loop that loops the # of times
    #values.length is just a representation of the number so it's basically like 3.times do
    if i.odd?
      deck1.cards << Card.new(suit, values[i], i+1) #values[i] is the - is an index position of the array values
    else
      deck2.cards << Card.new(suit, values[i], i+1)
    end
  end
end
deck1 = deck1.cards.shuffle
deck2 = deck2.cards.shuffle
#shuffled_deck = deck.cards.shuffle
