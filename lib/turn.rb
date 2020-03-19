class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def player1_first_card_rank
    player1.deck.rank_of_card_at(0)
  end

  def player2_first_card_rank
    player2.deck.rank_of_card_at(0)
  end

  def player1_third_card_rank
    player1.deck.rank_of_card_at(2)
  end

  def player2_third_card_rank
    player2.deck.rank_of_card_at(2)
  end

  def type
    if player1_first_card_rank == player2_first_card_rank && player1_third_card_rank == player2_third_card_rank
      :mutually_assured_destruction
    elsif player1_first_card_rank != player2_first_card_rank
      :basic
    else
      :war
    end
  end

  def winner
    if type == :basic
      if player1_first_card_rank > player2_first_card_rank
        player1
      else
        player2
      end
    elsif type == :war
      if player1_third_card_rank > player2_third_card_rank
        player1
      else
        player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
    else type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
    end
  end
end
