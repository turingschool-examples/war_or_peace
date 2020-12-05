class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
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
    welcome
  elsif input.upcase == 'GO'
    game_play
  end
end

  #method for game mechanics
def game_play
    count = 0
    while count < 10 do
      count += 1

        if turn.type == :war
          p "Turn #{count}: WAR - #{turn.winner.name} won 6 cards"

        elsif turn.type == :basic
            p "Turn #{count}: #{turn.winner.name} won 2 cards"

          elsif turn.type == :mutually_assured_destruction
            p "Turn #{count} *mutually assured destruction* 6 cards removed from play"
        end

        # break if player1.has_lost? || player2.has_lost?
        # require "pry"; binding.pry
      end
    # counter = 0
    #
    #   while counter <= 100000
  end
end
