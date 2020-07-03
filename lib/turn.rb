class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @spoils_of_war = []
  end
  def type
      
      if ( player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) ) &&
         ( player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2) )
        return :mutually_assured_destruction
      end

      if ( player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) ) &&
        ( player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2) )
        return :war
      end

      if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0);
        return :basic
      end
  end
  def winner
    return player1 if player2.has_lost?
    return player2 if player1.has_lost? 
    return player1 if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
    return player2 if type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
    return player1 if type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
    return player2 if type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
    return "No Winner" if type == :mutually_assured_destruction
  end
  def piles_cards
    return pile_cards_for_basics if type == :basic 
    return pile_cards_for_war if type == :war 
    return pile_cards_for_mad if type == :mutually_assured_destruction 
  end
  def award_spoils(winner)
    if winner == "No Winner"
      return
    end
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
  def pile_cards_for_basics
    @spoils_of_war << player1.deck.remove_card
    @spoils_of_war << player2.deck.remove_card
  end
  def pile_cards_for_war
    @spoils_of_war << player1.deck.cards.shift(3)
    @spoils_of_war << player2.deck.cards.shift(3)
    @spoils_of_war.flatten!
  end
  def pile_cards_for_mad
    @spoils_of_war << player1.deck.cards.shift(3)
    @spoils_of_war << player2.deck.cards.shift(3)
    @spoils_of_war.flatten!
  end
end