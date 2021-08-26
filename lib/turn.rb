class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn = :basic
    elsif player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      @turn = :war
    else
      @turn = :mutually_assured_destruction
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
      return "No Winner"
    end
  end

  def pile_cards
    type
    if @turn == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif @turn == :war
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player1.deck.cards[1]
        @spoils_of_war << player1.deck.cards[2]
        @spoils_of_war << player2.deck.cards[0]
        @spoils_of_war << player2.deck.cards[1]
        @spoils_of_war << player2.deck.cards[2]
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils
    if winner == player1
      pile_cards
      while @spoils_of_war != []
        player1.deck.add_card(@spoils_of_war[0])
        @spoils_of_war.shift
      end
    elsif winner == player2
      pile_cards
      while @spoils_of_war != []
        player2.deck.add_card(@spoils_of_war[0])
        @spoils_of_war.shift
      end
    else
      pile_cards
    end
  end
end
