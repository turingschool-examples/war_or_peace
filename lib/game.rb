class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{turn.player1.name} and #{turn.player2.name}"
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    choice
  end

  def choice
    user_input = gets.chomp.to_s.downcase
    user_input == 'go' ? play_game : start
  end

  def play_game
    i = 0
    100_000_000.times do
    i += 1
      if turn.type == :basic || turn.type == :war
        p "Turn #{i}: #{turn.winner.name} won #{turn.pile_cards.length} cards"
      else
        p "Turn #{i}: *mutually assured desctruction* #{turn.pile_cards.length} removed from play."
      end 
    break if game_over? == true
    end
  end  

  def game_over?  
    if turn.player1.has_lost?
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
      true
    elsif turn.player1.has_lost? 
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
      true
    end
  end

end     



