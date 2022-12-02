class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

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
    if type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        return player1
      else
        return player2
      end

    elsif type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        return player1
      else
        return player2
      end
      
    elsif type == :mutually_assured_destruction
      return 'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card

    end
   # @spoils_of_war = @spoils_of_war.flatten
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end

end