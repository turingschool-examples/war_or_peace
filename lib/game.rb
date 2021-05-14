
class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@turn.player1.name} and #{@turn.player2.name}. Type 'GO' to start the game!"

    play_game = gets.chomp
    if play_game.downcase == 'go'
      @turn.type
    else
      puts 'Some other time maybe'
    end
  end
end
