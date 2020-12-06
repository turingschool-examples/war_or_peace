class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def card_rank(player, index)
    player.deck.rank_of_card_at(index)
  end

  def type_basic?
    if card_rank(player1, 0) != card_rank(player2, 0)
       true
    end
  end

  def type_mutually_assured?
    if ((card_rank(player1, 0) == card_rank(player2, 0)) &&
        (card_rank(player1, 2) == card_rank(player2, 2)))
       true
    end
  end

  def type_war?
    if card_rank(player1, 0) == card_rank(player2, 0)
       true
    end
  end

  def type
    if type_basic? == true
      :basic
    elsif type_mutually_assured? == true
      :mutually_assured_destruction
    else
      :war
    end
  end

  def compare_ranks_at_0
    highest_rank_at_0 = []
    highest_rank_at_0 << (card_rank(player1, 0))
    highest_rank_at_0 << (card_rank(player2, 0))
  end

  def compare_ranks_at_2
    highest_rank_at_2 = []
    highest_rank_at_2 << (card_rank(player1, 2))
    highest_rank_at_2 << (card_rank(player2, 2))
  end

  def winner_at_0
    if (compare_ranks_at_0[0] > compare_ranks_at_0[1]) == true
      player1
    else (compare_ranks_at_0[0] < compare_ranks_at_0[1]) == true
      player2
    end
  end

  def winner_at_2
    if (compare_ranks_at_2[0] > compare_ranks_at_2[1]) == true
      player1
    else (compare_ranks_at_2[0] < compare_ranks_at_2[1]) == true
      player2
    end
  end

  def winner
    if (type == :basic)
      winner_at_0
    elsif (type == :war)
      winner_at_2
    else (type == :mutually_assured)
      "No Winner"
    end
  end

  def spoils
    player1_spoils = spoils_of_war << player1.deck.remove_card
    player2_spoils = spoils_of_war << player2.deck.remove_card
    (player1_spoils + player2_spoils)
  end

  def pile_cards
    if (type == :basic)
      spoils
    elsif (type == :war)
      3.times do
        spoils
      end
    else (type == :mutually_assured)
      player1.deck.remove_card
      player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards << spoils_of_war
  end
end
