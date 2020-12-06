require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


def make_deck
  shuffled_deck = []
  suits = [:diamond, :heart, :spade, :club]
  #Use to_a() to use all numbers in given range
  value = (2..14).to_a
    suits.collect do |suit|
      value.collect do |num|
        if num > 1 && num < 11
          shuffled_deck << Card.new(suit, "#{num}", num)
        elsif num == 11
          shuffled_deck << Card.new(suit, "Jack", num)
        elsif num == 12
          shuffled_deck << Card.new(suit, "Queen", num)
        elsif num == 13
          shuffled_deck << Card.new(suit, "King", num)
        elsif num == 14
          shuffled_deck << Card.new(suit, "Ace", num)
        end
      end
    end
    deck = shuffled_deck[0..51]
end

class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start_message
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    user_input = gets.chomp

    if user_input == "GO"
      start_game
    else
      start_message
    end
  end

  def start_game
    counter =0
    while counter <1000000
      counter +=1
      type = turn.type
      determine_winner = turn.winner
      turn.award_spoils(determine_winner)

      if turn.player1.has_lost == true || turn.loser == turn.player1.name
         p "*~*~*~* Aurora has won the game! *~*~*~*"
         break
      elsif turn.player2.has_lost == true || turn.loser == turn.player2.name
        p "*~*~*~* Megan has won the game! *~*~*~*"
        break
      end



        if determine_winner == turn.player1.name && type == :basic
            p "Turn#{counter}: #{turn.player1.name} has won 2 Cards"
        elsif determine_winner == turn.player2.name && type == :basic
            p "Turn#{counter}: #{turn.player2.name} has won 2 Cards"
        elsif determine_winner == turn.player1.name && type == :war
            p "Turn#{counter}: WAR - #{turn.player1.name} has won 6 Cards"
        elsif determine_winner == turn.player2.name && type == :war
                p "Turn#{counter}: WAR - #{turn.player2.name} has won 6 Cards"
        else p "Turn#{counter}: *mutually assured destruction* 6 cards removed from play"
        end

      if counter == 1000000
        return puts "---- DRAW ----"
      end
    end
  end
end
