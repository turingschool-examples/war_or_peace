class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
      elsif
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
        player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war
    end
  end

  def winner
    if type == :basic
       @winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
      elsif
        type == :war
        @winner = player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
      else
        @winner = "No Winner"
      end
    end

  def pile_cards
    if type == :basic
        pile_basic
      elsif
        type == :war
        pile_war
      elsif
        type == :mutually_assured_destruction
        pile_mutually_assured_destruction
    end
  end

  def pile_basic
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def pile_war
    3.times {@spoils_of_war << @player1.deck.remove_card}
    3.times {@spoils_of_war << @player2.deck.remove_card}
  end

  def pile_mutually_assured_destruction
    3.times { @player1.deck.remove_card }
    3.times { @player2.deck.remove_card }
  end

  def award_spoils
    @spoils_of_war.each {|spoils| @winner.deck.add_card(spoils)}
  end

end
