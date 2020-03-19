class Turn
  attr_reader :player1,
              :player2,
              :player1_first_card_rank,
              :player2_first_card_rank,
              :player1_third_card_rank,
              :player2_third_card_rank

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @player1_first_card_rank = player1.deck.rank_of_card_at(0)
    @player2_first_card_rank = player2.deck.rank_of_card_at(0)
    @player1_third_card_rank = player1.deck.rank_of_card_at(2)
    @player2_third_card_rank = player2.deck.rank_of_card_at(2)
  end

  def type
    if player1_first_card_rank == player2_first_card_rank && player1_third_card_rank == player2_third_card_rank
      :mutually_assured_destruction
    elsif player1_first_card_rank != player2_first_card_rank
      :basic
    else player1_first_card_rank == player2_first_card_rank
      :war
    end
  end

  def winner
    if type == :basic
      if player1_first_card_rank > player2_first_card_rank
        player1.name
      else player2_first_card_rank > player1_first_card_rank
        player2.name
      end
    elsif type == :war
      if player1_third_card_rank > player2_third_card_rank
        player1.name
      else player2_third_card_rank > player1_third_card_rank
        player2.name
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end







end
