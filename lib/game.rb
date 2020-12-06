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

    #gets users input and checks for lowercase
    input = gets.chomp
    if input.upcase != 'GO'
      start
    elsif input.upcase == 'GO'
      game_play
  end
end

def game_play
  #method for game mechanics
    while @counter < 1000000 do
      @counter += 1

        #mutual destruction
      if turn.type == :mutually_assured_destruction
          p "Turn #{@counter}: *mutually assured destruction* 6 cards removed from play"
          turn.pile_cards

        #war
      elsif turn.type == :war 
          p "Turn #{@counter}: WAR - #{turn.winner.name} won 6 cards"
          turn.pile_cards
          turn.spoils_of_war.shuffle
          turn.award_spoils(turn.winner)

        #basic
      elsif turn.type == :basic
          p "Turn #{@counter}: #{turn.winner.name} won 2 cards"
          turn.pile_cards
          turn.spoils_of_war.shuffle
          turn.award_spoils(turn.winner)
      end

      #determine winner
      if turn.player1.has_lost? == true
       return puts "*~*~*~* Aurora has won the game! *~*~*~*"
     elsif turn.player2.has_lost? == true
       return puts "*~*~*~* Megan has won the game! *~*~*~*"
     end

        #if no winner
        if @counter == 1000000
        p "---- DRAW ----"
      end
    end
  end
end
