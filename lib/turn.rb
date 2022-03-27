class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2) #omit first argument because it is duplicate logic from the first if statement
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else
      raise "Err. Turn type cannot be established." #raise returns an error and stops running code
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      else
        return player2
      end
    elsif type == :mutually_assured_destruction
      return "No Winner"
    else
      raise "Err. Winner cannot be determined." #raise returns an error and stops running code
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.cards.shift
      end
      3.times do
        spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    else
      raise "Err. Unexpected type." #raise returns an error and stops running code
    end
  end

  def award_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    spoils_of_war.clear
  end
end
