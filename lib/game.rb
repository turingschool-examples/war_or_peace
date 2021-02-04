
class Game
  attr_reader :player1,
              :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end



  def intro
    p "Welcome to War! (or Peace)." "This game will be played with 52 cards."
    p"The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "-------------------------------------------------------------"
  end

  def start
    count = 0
    while count < 100000000
    count += 1
    turn = Turn.new(@player1, @player2)
    if turn.type == :mutually_assured_destruction
      p "Turn #{count} mutually assured destruction, Stalement
            6 cards have been completely destroyed"
    elsif turn.type == :war
      p "Turn #{count}: #{turn.winner.name} won the battle and gains 6 cards."
    else turn.type == :basic
      p "Turn #{count}: #{turn.winner.name} won the skirmish and gains 2 cards."
    end
  end
  end
end
