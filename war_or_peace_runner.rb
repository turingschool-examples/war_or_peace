require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

p "------------------------------------------------------------------"
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"


value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
suit = ["Spade", "Heart", "Club", "Diamond"]

#Create 52 Cards (A standard deck)
full_deck = []
  suit.each do |suit|
      rank.size.times do |index|
        full_deck << Card.new(suit, value[index], rank[index])
  end
end

#Put those cards into two Decks (some randomness would be nice here!)
shuffled_deck = full_deck.shuffle
deck1 = Deck.new(shuffled_deck.take(26))
deck2 = Deck.new(shuffled_deck.drop(26))

#Create two players with the Decks you created
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

#Start the game using a new method called start
# => this method will need to be included in a class - it's up to you which class to include it in
# => either and existing class or newS
if gets.chomp!.downcase == 'go'
  turn.start
else
  puts "Whoops, try again"
  # new_game.start
end


# require "pry"; binding.pry

# def start
  # for each turn, determine a winner, award_spoils
  #use .each? for loop?
  #loop checks amount of cards
  #until/while/for check until player1.deck = [] || player2.deck = []
  #run turn/play game
  # if turn.type == :basic
  #    "#{turn.number} #{turn.winner} won 2 cards"
  # elsif turn.type == :war
  #   "WAR - #{turn.winner} won 6 cards"
  # elsif turn.type == :mutually_assured_destruction
  #   "*mutually assured destruction* 6 cards removed from play"
  # end
#end

#need to iterate through game/turns until one player has no cards or max of 1million turns.
# until ((deck1.length == 0 || deck2.length == 0) || turn_number == 1000000) do #deck.any? shorthand of stopping loop
#   puts "*~*~*~* #{turn.winner} has won the game! *~*~*~*"
#    turn_number += 1
# if turn.number == 1000000
    # "---- DRAW ----"




turn_number = 1
if turn_number == 1000000
  puts "---- DRAW ----"
elsif (turn_number < 1000000) && (deck1 == [] || deck2 == [])
  puts "*~*~*~* #{turn.winner} has won the game! *~*~*~*"
else
  # turn_number = 1
  until ((turn_number == 1000000) || (deck1 == [] || deck2 == [])) do
    winner = turn.winner
    turn.pile_cards
    puts "Turn #{turn_number}: #{turn.winner} won #{turn.pile_cards.length} cards"
    turn.award_spoils(winner)
    turn_number += 1
  end
  puts "*~*~*~* #{turn.winner} has won the game! *~*~*~*"
end
