require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"] #values = card name
suits = ["Hearts", "Spades", "Diamonds", "Clubs"]
deck1 = Deck.new([])
deck2 = Deck.new([])

suits.each do |suit|
  13.times do |i|
    if i.even?
      deck1.cards << Card.new(suit, values[i], i+1)
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
      while player1.has_lost? == false || player2.has_lost? == false do
        if player1.has_lost? || player2.has_lost?
          return
        end
        turn_count += 1
        if turn_count == 1000000
          puts "DRAW"
          return
        end

        turn_type = turn.type
        turn_winner = turn.winner
        cards_won = turn.pile_cards

        turn.award_spoils(turn_winner)

        if turn_type == :war
          puts "Turn #{turn_count}: WAR - #{turn_winner.name} won #{cards_won} cards"
        elsif turn_type == :mutually_assured_destruction
          puts "*mutually assured destruction* cards removed from play"
        elsif turn_type == :basic
          if turn_winner.nil?
          end

          puts "Turn #{turn_count}: #{turn_winner.name} won #{cards_won} cards"
        end
      end
    else
      puts "Please type 'GO' to start!"
    end
