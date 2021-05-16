class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_first_card = @player1.deck.rank_of_card_at(0)
    player2_first_card = @player2.deck.rank_of_card_at(0)
    player1_third_card = @player1.deck.rank_of_card_at(2)
    player2_third_card = @player2.deck.rank_of_card_at(2)
    if player1_first_card == player2_first_card && player1_third_card == player2_third_card
      return :mutually_assured_destruction
    elsif player1_first_card == player2_first_card
      return :war
    else
      return :basic
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end

    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end

    else type == :mutually_assured_destruction
      return "No Winner"
    end

    def pile_cards
      if type == :basic
        @spoils_of_war = ([card1, card3])
      elsif type == :war
        @spoils_of_war = ([card1, card2, card5, card3, card4, card6])
      elsif type == :mutually_assured_destruction
        @spoils_of_war = []
      end

    def award_spoils(winner)
    end
  end

end
