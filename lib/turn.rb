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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war

    elsif (@player1.deck.rank_of_card_at(0) &&  @player1.deck.rank_of_card_at(2)) == (@player1.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2))
        :mutually_assured_destruction
    end
  end


  def winner
        # if the turn has a type of :war, the winner will be whichever player has a higher rank_of_card_at(2)
      if type == :mutually_assured_destruction
            "No Winner"
      elsif type == :war
          if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            @player1
          elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
            @player2
          end
        #if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
      elsif type == :basic
          if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @player1
          elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
            @player2
          end
     end
  end


  def pile_cards
        # for a :basic turn, each player will send one card (the top card) to the spoils pile
    if type == :basic
      @spoils_of_war  << player1.deck.cards[0]
      @spoils_of_war  << player2.deck.cards[0]

      # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
    elsif type == :war
      @spoils_of_war  << player1.deck.cards[0]
      @spoils_of_war  << player2.deck.cards[0]

    elsif type == :mutually_assured_destruction
        3.times do
        player1.deck.remove_card
        player2.deck.remove_card
        end
    end
  end

    #this method will add each of the cards in the @spoils_of_war array to the winner of the turn
    #left off here...below code needs to be fixed!!!
    def awards_spoils
      if @player1.winner
        @spoils_of_war
      elsif @player2.winner
        @spoils_of_war
      end
    end

end
