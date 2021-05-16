class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    player1_first_card = @player1.deck.rank_of_card_at(0)
    player2_first_card = @player2.deck.rank_of_card_at(0)
    player1_third_card = @player1.deck.rank_of_card_at(2)
    player2_third_card = @player2.deck.rank_of_card_at(2)
    if player1_first_card == player2_first_card && player1_third_card == player2_third_card
      return :mutually_assured_destruction
    elsif player1_first_card == player2_first_card && player1_third_card != player2_third_card
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
    else
      return false
    end
  end

  def pile_cards
    # require "pry"; binding.pry
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      @spoils_of_war.concat(@player1.deck.cards.shift(3))
      @spoils_of_war.concat(@player2.deck.cards.shift(3))
    else type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.add_card(card)
      end
    else
      @spoils_of_war.each do |card|
        @player2.deck.add_card(card)
      end
    end
  end
end
