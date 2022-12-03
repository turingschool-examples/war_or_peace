require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'

big_deck = CardGenerator.new('cards.txt').cards
shuffled_deck = Deck.new(big_deck.shuffle)

array1 = []
array2 = []
27.times do |i|
array1 << shuffled_deck.cards[i]
array2 << shuffled_deck.cards[i+1]
end

player1_deck = Deck.new(array1)
player2_deck = Deck.new(array2)



puts "Welcome to War! \(or Peace\) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

player1 = Player.new("Megan", player1_deck)
player2 = Player.new("Aurora", player2_deck)

counter = 0
turn = Turn.new(player1, player2)
start = gets

if start.upcase == "GO\n"
  loop do
    counter += 1
    if turn.type == :basic
      puts "TURN #{counter}: #{turn.winner.name} won 2 cards"
    elsif turn.type == :war
      puts "TURN #{counter}: WAR - #{turn.winner.name} won 6 cards"
    elsif turn.type == :mutually_assured_destruction
      puts "TURN #{counter}: *mutually assured destruction* 6 cards removed from play"
    else #tiebreaker phase
      if player1.deck.cards.length > player2.deck.cards.length
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        break
      elsif player2.deck.cards.length > player1.deck.cards.length
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      break
      else
        puts "---- DRAW ----"
        break
      end

    end
    winner = turn.winner 
    turn.pile_cards
    turn.award_spoils(winner)

    if player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      break
    end

    if player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      break
    end

    if (counter == 1_000_000)
      puts "---- DRAW ----"
        break
    end
    
  end
end

