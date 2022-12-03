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
    1_000_000.times do

    i += 1
    game_over?
      if turn.type == :basic 
        round_winner = turn.winner
        turn.pile_cards
        p "Turn #{i}: #{round_winner.name} won #{turn.spoils_of_war.length} cards"
        turn.award_spoils(round_winner)
      elsif turn.type == :war
        round_winner = turn.winner
        turn.pile_cards
        p "Turn: #{i}: WAR - #{round_winner.name} won #{turn.spoils_of_war.length} cards"
        turn.award_spoils(round_winner)
      else
        p "Turn #{i}: *mutually assured destruction* 6 cards removed from play."
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



