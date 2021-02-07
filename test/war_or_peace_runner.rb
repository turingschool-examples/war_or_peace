require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
 # require "pry"; binding.pry

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

cue = "> "
start = nil
until (start == 'GO' || start == 'g') #make 'go'
    print cue
    start = gets.chomp
end

suits = [:spades, :hearts, :diamonds, :clubs]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
full_deck = []

suits.each do |suit|
  values.size.times {|r| full_deck << Card.new( suit, values[r], r+2 )}
end

full_deck = full_deck.shuffle.shuffle
deck1 = Deck.new([])
deck2 = Deck.new([])

player1 = Player.new('Meagan', deck1)
player2 = Player.new('Aurora', deck2)
# turn = Turn.new(player1, player2)

26.times do |index|
  player1.deck.cards << full_deck.shift
  player2.deck.cards << full_deck.shift
end

game = Game.new(player1,player2)
game.start_a_war

# def start_a_war
#   line = 1
#   result = nil
#   # require "pry"; binding.pry
#   until player1.has_lost? == true || player2.has_lost? == true
#     turn = Turn.new(player1, player2)
#     result = turn.type
#     if result == :mutually_assured_destruction
#       victor = "No Winner"
#     else
#       victor = turn.winner
#     end
#     turn.pile_cards
#     turn.award_spoils(victor)
#     if result == :mutually_assured_destruction
#       p "Turn #{line}: *mutually assured destruction* 6 cards removed from play"
#       # require "pry"; binding.pry
#     elsif result == :war
#       p "Turn #{line}: WAR - #{victor.name} won 6 cards"
#     else
#       p "Turn #{line}: #{victor.name} won 2 cards"
#     end
#     p player1.deck.cards.size
#     p player2.deck.cards.size
#     line +=1
#     break if line == 1001
#   end
#   end_the_war
# end
#
# def end_the_war
#   if turn.player1.has_lost? == true || turn.player2.has_lost? == true
#     p "*~*~*~* #{victor.name} has won the game! *~*~*~*"
#   else
#     p "---- DRAW ----"
#   end
#   p "Player 1 cards: " + player1.deck.cards.size.to_s
#   p "Player 2 cards: " + player2.deck.cards.size.to_s
# end

# game = Game.new
# player1.deck.cards << full_deck[index]
# player2.deck.cards << full_deck[index+26]
# turn.finish

# values = %w{'2' '3' '4' '5' '6' '7' '8' '9' '10' 'Jack' 'Queen' 'King' 'Ace'}
# suits = %w{:spades :hearts :diamonds :clubs}
# ranks = %w{2 3 4 5 6 7 8 9 10 11 12 13 14}
# 10.times {|n| full_deck << card=Card.new(:heart, "#{n}", n)}
