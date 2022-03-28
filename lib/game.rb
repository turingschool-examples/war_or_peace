
class Game
  attr_reader :turn_counter, :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_counter = 0
  end

  # def start
  #   until player1.has_lost? || player2.has_lost?
  #     turn.type
  #     turn.pile_cards
  #     turn.winner
  #     turn.award_spoils
  #   end
  #
  #     if turn.type
  #       :basic
  #     elseif turn.type
  #      :war
  #     else
  #       :mutually_assured_destruction
  #     end
  # end
end
