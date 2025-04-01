class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # add a safeguard against the undefined method 'deck' for nil:NilClass" error
    # which happens if the @player is nil when the other class methods and attributes are being called
    return :unknown if @player1.nil? || @player2.nil?
    
    # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    # A :war turn occurs when both players’ rank_of_card_at(0) are the same
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same 
      if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
      else 
      :war
      end
    end
  end

  # this method will determine the winner of the turn.
  def winner
    # add a safeguard against the undefined method 'deck' for nil:NilClass" error
    # which happens if the @player is nil when the other class methods and attributes are being called
    return "No Winner" if @player1.nil? || @player2.nil?

    # if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    # if the turn has a type of :mutually_assured_destruction the method will return No Winner
    elsif type == :mutually_assured_destruction
      return "No Winner"
    else 
      return "No Winner"
    end
  end
  
  # when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on certain rules
  def pile_cards
    # for a :basic turn, each player will send one card (the top card) to the spoils pile
    if type == :basic
      @spoils_of_war.push(@player1.deck.remove_card)
      @spoils_of_war.push(@player2.deck.remove_card)
    # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
    elsif type == :war
      3.times do 
        @spoils_of_war.push(@player1.deck.remove_card)
      end
      3.times do 
        @spoils_of_war.push(@player2.deck.remove_card)
      end
    # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck).
    # These cards are not sent to the spoils pile, they are simply removed from each players’ deck
    elsif type == :mutually_assured_destruction
      3.times do 
        @player1.deck.remove_card
      end
      3.times do 
        @player2.deck.remove_card
      end
    end
  end

  # this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards.concat(@spoils_of_war)
    elsif winner == @player2
      @player2.deck.cards.concat(@spoils_of_war)
    elsif winner == "No Winner"

    end
  
    #@spoils_of_war.clear
    # will ask in Slack - not sure if we should be adding a way to clear the @spoils_of_war array after it's awarded so the same cards don't keep getting added?

  end

end


