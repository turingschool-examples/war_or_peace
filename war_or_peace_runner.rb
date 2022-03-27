require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'   #binding.pry

# Create 52 Cards (A standard deck)
#Googled "how to create a deck in Ruby" to see if there was a method to allow the making of the cards to be easier/faster and found
#a method that allows to loop over values and suits (Thank you stackoverflow!)
# ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
# suits = %w{Spades Hearts Diamonds Clubs}
# suits.each do |suit|
#   ranks.size.times do |i|
#     stack_of_cards << Card.new( ranks[i], suit, i+1 )
#   end
# end
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"] #values = card name
suits = ["Hearts", "Spades", "Diamonds", "Clubs"]
deck1 = Deck.new([])
deck2 = Deck.new([])

suits.each do |suit| #suits are the suits (duh, hearts/spades/diamonds/clubs)
  13.times do |i| #<- i is index position of value and i is a variable here & anytime you set a thing = to something the thing is a variable
    #- values.length (which is now 13.times)- returns an integer--.times is a method on integers that creates a loop that loops the # of times
    #values.length is just a representation of the number so it's basically like 3.times do that I used in turn.rb for pile_cards method
    if i.odd? #wanted to split the cards into 2 decks and
      deck1.cards << Card.new(suit, values[i], i+1) #values[i] is the - is an index position of the array values
    else
      deck2.cards << Card.new(suit, values[i], i+1)
    end
  end
end

player1 =Player.new('Megan', deck1)
player2 =Player.new('Aurora', deck2)
player1.deck.cards.shuffle!
player2.deck.cards.shuffle!
turn = Turn.new(player1, player2)
turn_count = 0


p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

game = gets.chomp.upcase
    if game == "GO"
      while player1.deck.cards.length > 0 || player2.deck.cards.length > 0 do
        turn_count += 1
        if turn_count == 100
          puts "DRAW"
          return
        end
        turn_type = turn.type
        turn_winner = turn.winner
        turn.pile_cards
        turn.award_spoils(turn_winner)
        if turn_winner == "No Winner"
          puts "No Winner"
          return
        end
        puts "Turn #{turn_count} #{turn_winner.name} won #{turn.spoils_of_war.length} cards"
        puts turn_winner.deck.cards.length
      end
    else
      puts "Please type 'GO' to start!"
    end
