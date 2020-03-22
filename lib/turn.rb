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
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif @type == :mad
      first_cards_are_same = player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      second_cards_are_same = player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      if first_cards_are_same && second_cards_are_same
        player1.deck.remove_card
        player1.deck.remove_card
        player1.deck.remove_card
        player2.deck.remove_card
        player2.deck.remove_card
        player2.deck.remove_card
        "No Winner"
      end
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
