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

    choice = gets.chomp.to_s
    choice.downcase == 'go' ? output_game : start
  end


  def output_game
    i = 1
    100.times do
     i += 1
     if turn.type == :basic
      p "#{turn.winner.name} won #{turn.pile_cards.length} cards"
      turn.award_spoils(turn.winner)
     elsif turn.type == :war 
      p "WAR - #{turn.winner.name} won #{turn.pile_cards.length} cards"
      turn.award_spoils(turn.winner)
     else
      p "*mutually assured desctruction* #{turn.pile_cards.length} removed from play."
     end





    # if turn.winner.class != String
    #   turn.winner
    #   p turn.winner.name
    #   turn.pile_cards
    #   turn.award_spoils(turn.winner)
    # else 
    #   turn.winner
    #   p turn.winner.name
    #   turn.pile_cards
    # end
       
    # p turn.winner
    # p turn.pile_cards
    # p turn.award_spoils(turn.winner)
    
      # if turn.winner != "No Winner"
      #   turn.pile_cards
      #   turn.award_spoils(turn.winner)
      # else
      #   turn.pile_cards
      # end
      

      
      if turn.player1.deck.cards == []
        game_winner = turn.player2.name
        p '*~*~*~* #{game_winner} has won the game! *~*~*~*'
        break
      elsif turn.player2.deck.cards == []
        game_winner= turn.player1.name
        p '*~*~*~* #{game_winner} has won the game! *~*~*~*'
        break
      end
    end

    puts "*~*~*~* Aren't you bored of playing war? No one won the game! *~*~*~*"
     
  end
end



