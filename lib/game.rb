require 'pry'


class Game
  attr_reader :turns

  def initialize (turns)
    @turns = turns
  end

  def welcome
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
  end

  def game_winner
    if turns.player1.deck.cards  == [] && turns.player2.deck.cards == []
      p "This is mathmatically near impossible, you have accomplished something rare! It is impressive, but everyone LOSES."
    elsif turns.player1.deck.cards  == []
      p "*~*~*~* Aurora has won the game! *~*~*~*"
    elsif turns.player2.deck.cards == []
      p "*~*~*~* Megan has won the game! *~*~*~*"
    elsif
      Turn.type
      Turn.pile_cards
      Turn.award_spoils(player)
    end
  end

end

  # if    turn.player1.deck == []
      #   "*~*~*~* Aurora has won the game! *~*~*~*"
      # elsif turn.player2.deck == []
      #   "*~*~*~* Aurora has won the game! *~*~*~*"
      # # elsif
      # #  determine type, determine winner, pile cards, award spoils, play another turn
#       end
#     end
#   end
# end
