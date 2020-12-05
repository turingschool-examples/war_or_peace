require './lib/turn'
class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
       input = gets.chomp.upcase
       if input == "GO"
         turn_num = 1
         while turn_num < 1000000 && player1.has_lost? == false && player2.has_lost? == false
           turn = Turn.new(player1, player2)
# It is getting confused when there aren't enough cards for a war, but neither deck is empty
            turn.type
            turn.winner
            turn.pile_cards
            if turn.type == :mutually_assured_destruction
              puts "No winner"
            else
              puts "Turn #{turn_num}: #{turn.type}: The winner is #{turn.winner.name}. They won #{turn.pile_cards.length} cards."
            end
            turn_num += 1
            turn.award_spoils
          end
          puts "game over"
       else
         puts "I'm afraid I can't do that."

       end
   end

end
