require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war =[]
  end

  def type

    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic  #lazy forcing
    end

  end

  def winner
    case self.type
    when  :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
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
        @spoils_of_war.push(@player1.deck.remove_card)
        @spoils_of_war.push(@player1.deck.remove_card)
        @spoils_of_war.push(@player1.deck.remove_card)
        @spoils_of_war.push(@player2.deck.remove_card)
        @spoils_of_war.push(@player2.deck.remove_card)
        @spoils_of_war.push(@player2.deck.remove_card)
    else
        @player1.deck.remove_card
        @player2.deck.remove_card
        @player1.deck.remove_card
        @player2.deck.remove_card
        @player1.deck.remove_card
        @player2.deck.remove_card
    end

  end

  # add spoils to the bottom of winner's deck
  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
    @spoils_of_war = []
  end

end
