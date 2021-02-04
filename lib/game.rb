class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome_message
    puts "      Welcome to War! (or Peace) This game will be played
      with 52 cards.
      The players today are #{@player1.name} and #{@player2.name}.
      Type 'GO' to start the game!
      ________________________________________________________"
  end

  def start
    turn = Turn.new(@player1, @player2)
    p turn.winner.name
  end
end
