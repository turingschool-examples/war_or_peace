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
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    else #don't NEED an else statement.  But it seems like I do need the conditional here: 

    # else player1.rank_of_card_at(0) == player2.rank_of_card_at(0) && player1.rank_of_card_at(0) == player2.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) == true
      player1
      # later:     if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) || if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) == true
    else
      player2
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]

      #remove_card from player1 and player2
      #that card will go into the @spoils_of_war array
    end
  end

  def award_spoils(winner)
    # @spoils_of_war.each do |card|
      winner.deck.cards.concat(@spoils_of_war)
      @spoils_of_war = []
      # winner.deck.cards.unshift(card)
    # end
    #add cards in @spoils_of_war array to the deck of winner of the turn

    # winner.deck.cards << @spoils_of_war[0] 
    # winner.deck.cards << @spoils_of_war[1]
    #can I use this ^ since there will only be two cards in #s_o_w at any time?  Or should I iterate with ennumerable out of good practice?

    # tried this in ine 45: `winner.deck.cards.unshift(card)``
    #attr_accessor in Deck class?  But why didn't I need it in #pile_cards
    #.append?
  end
end