
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
   if first_card(@player1) == first_card(@player2) && third_card(@player1) == third_card(@player2)
     return :mutually_assured_destruction
   elsif first_card(@player1) == first_card(@player2) && third_card(@player1) != third_card(@player2)
     return :war
   else
     return :basic
   end
  end

  def winner
    if type == :basic
      first_card(@player1) > first_card(@player2) ? @player1 : @player2
    elsif type == :war
      third_card(@player1) > third_card(@player2) ? @player1 : @player2
    else
      return "No Winner"
    end

  end

  def pile_cards
    @spoils_of_war << @player1.remove_card
    @spoils_of_war << @player2.remove_card
  end

  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards << @spoils_of_war
    elsif winner == @player2
      @player2.deck.cards << @spoils_of_war
    end
  end

  #helper methods
  def first_card(player)
    player.deck.rank_of_card_at(0)
  end

  def third_card(player)
    player.deck.rank_of_card_at(2)
  end
end
