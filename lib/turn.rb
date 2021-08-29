require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war =[]
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      return :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

  def winner
    case self.type
    when  :basic
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
      return "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
        @spoils_of_war.push(@player1.deck.remove_card)
        @spoils_of_war.push(@player2.deck.remove_card)
    elsif self.type == :war
      3.times do
        @spoils_of_war.push(@player1.deck.remove_card)
        @spoils_of_war.push(@player2.deck.remove_card)
      end
    elsif self.type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end

  end

  # add spoils to the bottom of winner's deck
  def award_spoils(winner)
    while !@spoils_of_war.empty?
      card = @spoils_of_war.pop
      winner.deck.add_card(card)
    end
  end

end
