class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic
    end
  end

  def winner
    if type() == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif type() == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    if type() == :basic
      # require "pry"; binding.pry
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.remove_card
      @player2.deck.remove_card

      return @spoils_of_war

    elsif type() == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]

      3.times do
        @player1.deck.remove_card
      end

      3.times do
        @player2.deck.remove_card
      end

      return @spoils_of_war

    else
      3.times do
        @player1.deck.remove_card
      end

      3.times do
        @player2.deck.remove_card
      end

      @player1.deck.cards
      @player2.deck.cards
    end
  end

def award_spoils
  if type() == :basic
    if @player1.winner == true
      award_spoils = @player1.deck.cards << @spoils_of_war.pile_cards
    else
      award_spoils = @player2.deck.cards << @spoils_of_war.pile_cards
    end
  else
    return "NOPEEEEE"
  end
end




end # this is the end of the class!!!
