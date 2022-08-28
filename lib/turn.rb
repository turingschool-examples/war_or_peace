class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner
  def initialize(player1, player2)
    
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = nil
  end

  def type 
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    :basic
  else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    :war
    end
  end
  def winner
    if type == :basic
      # will return whichever player has a higher rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) 
      @winner = player1
      else @winner = player2
      end
    elsif type == :war
      # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) 
      @winner = player1
      else @winner = player2
      end
    end
  end
  def pile_cards
    # Each player will send the top card to the spoils pile
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    end
    if type == :war
      3.times {@spoils_of_war << player1.deck.remove_card}
      3.times {@spoils_of_war << player2.deck.remove_card}
    end
  end
  def award_spoils(winner)
    # binding.pry
    @winner.deck.cards.concat(@spoils_of_war)
  end
end


# end
# def award_spoils
# end

  #TYPE 
    #   player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)  
    #   :mutually_assured_destruction
    # 
    # elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    #   :war
    # 
    # else :basic


# turns
  # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
  # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
  
# winner: this method will determine the winner of the turn.
  
  # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
  
  # if the turn has a type of :mutually_assured_destruction the method will return No Winner.

# pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
  
  # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
  
  # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.

# award_spoils: this method will add each of the cards in the @spoils_of_war array to the winner of the turn.