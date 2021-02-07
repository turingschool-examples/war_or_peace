
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # player 1 card not equal to player2 card
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      return player2
    elsif player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player1
    elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      return player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war.flatten!
    elsif == :war
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war.flatten!
    else == :mutually_assured_destruction
      player1.deck.remove_card.delete_at(0,1,3)
      player2.deck.remove_card.delete_at(0,1,3)

    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war.shift(spoils_of_war.length)
    winner.deck.cards.flatten!
  end
end
