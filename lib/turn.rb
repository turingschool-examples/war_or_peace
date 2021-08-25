# require "./card"
# require "./deck"
# require "./player"

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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    else
      puts "Error: unable to determine type"
    end
  end

  def winner
    round_type = type
    if type == :mutually_assured_destruction
      puts "No Winner"
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    else
      puts "Error: no type"
    end
  end

  def pile_cards

  end
end
