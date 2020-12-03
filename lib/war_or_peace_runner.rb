require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
#what method is actually called when turn.start happens?
# turn.start
#
#
# puts "Welcome to War! (or Peace) This game will be played with 52 cards."
# puts "The players today are Megan and Aurora."
# puts "Type 'GO' to start the game!""
# "------------------------------------------------------------------"
#
# input = gets.chomp.downcase
# if input == 'go'

card1 = Card.new('2', 'Heart', 2)
card2 = Card.new('3', 'Heart', 3)
card3 = Card.new('4', 'Heart', 4)
card4 = Card.new('5', 'Heart', 5)
card5= Card.new('6', 'Heart', 6)
card6 = Card.new('7', 'Heart', 7)
card7 = Card.new('8', 'Heart', 8)
card8 = Card.new('9', 'Heart', 9)
card9 = Card.new('0', 'Heart', 10)
card10 = Card.new('Jack', 'Heart', 11)
card11= Card.new('Queen', 'Heart', 12)
card12 = Card.new('King', 'Heart', 13)
card13 = Card.new('Ace', 'Heart', 14)
cards1 = [card1, card3, card5, card7, card11, card13]
cards2 = [card2, card4, card6, card8, card10, card12]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
@player1 = Player.new('clarisa', deck1)
@player2 = Player.new('Aurora', deck2)


def start
  counter = 1

  while counter < 101
    turn = Turn.new(@player1, @player2)
    turn.type
    turn.winner
    turn.pile_cards
    require "pry"; binding.pry
    puts "Turn #{counter}: #{turn.winner.name} won #{@spoils_of_war.length} cards"
    counter += 1
  end
end

start
