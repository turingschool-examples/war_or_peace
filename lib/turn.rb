class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn_type
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @turn_type = nil
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      if player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
        @turn_type = :war
      elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        @turn_type = :mutually_assured_destruction
      end
    end
  end

  def winner
    if @turn_type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      else
        winner = player2
      end
    elsif @turn_type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      else
        winner = player2
      end
    elsif @turn_type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if @turn_type == :basic
      spoils_of_war.push(player1.deck.remove_card)
      spoils_of_war.push(player2.deck.remove_card)
    elsif @turn_type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
      @spoils_of_war = spoils_of_war.flatten
    elsif @turn_type == :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    spoils_of_war.each {|card| winner.deck.cards.push(card)}
    spoils_of_war = []
  end
end