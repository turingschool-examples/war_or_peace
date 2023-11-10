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
     #don't NEED an else statement.  But it seems like I do need the conditional here: 

    elsif player1.rank_of_card_at(0) == player2.rank_of_card_at(0) && player1.rank_of_card_at(0) == player2.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  #can I fit all types in this winner method or do I need to do a #basic_winner #war_winner as helper methods?
  def winner
    #basic
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) == true
      player1 

    #war
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) == true && (player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2))
      player1
    else
      player2
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif self.type == :war
      @spoils_of_war.concat(player1.deck.cards[0..2].flatten)
      @spoils_of_war.concat(player2.deck.cards[0..2].flatten)
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