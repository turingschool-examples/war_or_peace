class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.cards[0] == @player2.deck.cards[0]) &&
      (@player1.deck.cards[2] == @player2.deck.cards[2])
      return :mutually_assured_desruction
    elsif @player1.deck.cards[0] == @player2.deck.cards[0]
      return :war
    else
      return :basic
    end
  end

  def winner
    if (type == :basic)
      player1_value = @player1.deck.cards[0].rank
      player2_value = @player2.deck.cards[0].rank
      if player1_value > player2_value
        return player1.name
      else return player2.name
      end
    else (type == :war)
    end
  end
require "pry"; binding.pry
  # def pile_cards
  #
  # end


end
