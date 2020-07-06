class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_card1 = @player1.deck.cards[0]
    player2_card1 = @player2.deck.cards[0]
    if (player1_card1 && player2_card1)
      first_pair_matches = player1_card1.rank == player2_card1.rank
    end
    if (first_pair_matches)
      second_pair_matches = @player1.deck.cards[2].rank == @player2.deck.cards[2].rank || false
      if (second_pair_matches)
        return :mutually_assured_destruction
      end
      return :war
    else
      return :basic
    end
  end


  def winner
    if type() == :mutually_assured_destruction
      return 'No Winner'
    else
      i = type() == :basic ? 0 : 2
      if (!@player1.deck.cards[i])
        return @player2
      elsif (!@player2.deck.cards[i])
        return @player1
      else
        who_won = @player1.deck.cards[i].rank > @player2.deck.cards[i].rank
        return who_won ? @player1 : @player2
      end
    end
  end

  def pile_cards
    if type() == :mutually_assured_destruction
      @player1.deck.cards.slice!(0,3)
      @player2.deck.cards.slice!(0,3)
    else
      num_cards_to_remove = type() == :war ? 3 : 1
      player1Cards = @player1.deck.cards.slice!(0,num_cards_to_remove)
      player2Cards = @player2.deck.cards.slice!(0,num_cards_to_remove)

      @spoils_of_war.concat(player1Cards)
      @spoils_of_war.concat(player2Cards)
    end
  end

  def award_spoils(winner)
    if (winner != 'No Winner')
      winner.deck.cards.concat(@spoils_of_war)
    end
    @spoils_of_war = []
  end
end
