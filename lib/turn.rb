class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # require "pry"; binding.pry
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      if player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        type = :mutually_assured_destruction
      else
        type = :war
      end
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
        # require "pry"; binding.pry
      else
        winner = player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      else
        winner = player2
        # require "pry"; binding.pry
      end
    elsif type == :mutually_assured_destruction
      winner = "No winner"
    end
  end

  # def pile_cards
  # end
  #
  # def award_spoils(winner)
  # end

end
