class Turn
  attr_reader :player1, :player2, :spoils_of_war, :cards_removed_from_play

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @cards_removed_from_play = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :basic
      winner_by_rank_of_card_at(0)
    elsif type == :war
      winner_by_rank_of_card_at(2)
    else #mutually_assured_destruction
      "No Winner"
    end
  end

  def winner_by_rank_of_card_at(index)
    if player1.deck.rank_of_card_at(index) > player2.deck.rank_of_card_at(index)
      player1
    else
      player2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    else #mutually_assured_destruction
      3.times do
        @cards_removed_from_play << player1.deck.remove_card
        @cards_removed_from_play << player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end

end
