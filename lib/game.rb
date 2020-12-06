class Game
  attr_reader :turn,
              :counter
  def initialize(turn)
    @turn = turn
    @counter = 0
  end

  def start
    #this method receives user input to 'start' game
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
  input = gets.chomp
  #gets users input and checks for lowercase
  if input.upcase != 'GO'
    start
  elsif input.upcase == 'GO'
    game_play
  end
end

def game_play
  #method for game mechanics
    until @counter == 1000000 do
      @counter += 1

        #decide the winner
        if turn.player1.has_lost? == true
          p "*~*~*~* Aurora has won the game! *~*~*~*"
        elsif turn.player2.has_lost? == true
          p "*~*~*~* Megan has won the game! *~*~*~*"
        end

        #mutual destruction
        if turn.type == :mutually_assured_destruction
          p "Turn #{@counter}: *mutually assured destruction* 6 cards removed from play"
          turn.pile_cards
          turn.spoils_of_war.shuffle

        #war
      elsif turn.type == :war && turn.winner == turn.player1
          p "Turn #{@counter}: WAR - Megan won 6 cards"
          turn.pile_cards
          turn.spoils_of_war.shuffle
          turn.award_spoils(turn.player1)
        elsif turn.type == :war && turn.winner == turn.player2
          p "Turn #{@counter}: WAR - Aurora won 6 cards"
          turn.pile_cards
          turn.spoils_of_war.shuffle
          turn.award_spoils(turn.player2)

        #basic
      elsif turn.type == :basic && turn.winner == turn.player1
          p "Turn #{@counter}: Megan won 2 cards"
          turn.pile_cards
          turn.spoils_of_war.shuffle
          turn.award_spoils(turn.player1)
      elsif turn.type == :basic && turn.winner == turn.player2
        p "Turn #{@counter}: Aurora won 2 cards"
        turn.pile_cards
        turn.spoils_of_war.shuffle
        turn.award_spoils(turn.player2)
      end

        #if no winner
        if @counter == 1000000
        p "---- DRAW ----"
      end
    end
  end
end
