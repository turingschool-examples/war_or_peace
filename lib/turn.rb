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
    return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    return :war if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    return :mutually_assured_destruction if @player1.deck.rank_of_card_at(0,2) == @player2.deck.rank_of_card_at(0,2)
  end
end

  def winner
    case self.type
    when :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
    end
    when :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
    end
    when :mutually_assured_destruction
      return "No winner"
    end
  end

  def pile_of_cards
  end

  def award_spoils
  end


# require "pry"; binding.pry
