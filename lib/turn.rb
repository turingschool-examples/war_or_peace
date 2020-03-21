class Turn
  attr_reader :player1,
              :player2,
              :type,
              :spoils_of_war

  attr_accessor :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @type = :basic
    @spoils_of_war = []
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def pile_cards
    spoils_of_war << player1.deck.remove_card
    spoils_of_war << player2.deck.remove_card
  end

  def award_spoils(winner)
    winner.deck.cards << spoils_of_war
  end
end



#award_spoils: this method will add each of the cards in the @spoils_of_war array
#to the winner of the turn.
