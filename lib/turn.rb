require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      type = :war
    elsif (player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2)) == (player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2))
      type = :mutually_assured_destruction
    end
  end
  def winner
    if type == :basic
      #array = [player1.deck.rank_of_card_at(0), player2.deck.rank_of_card_at(0)]
      #binding.pry
      #array.max
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      return 'No Winner'
    end
  end
end
