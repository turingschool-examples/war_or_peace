class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
          player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&

          player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      else winner = player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      else winner = player2
      end

    elsif type == :mutually_assured_destruction
      winner = "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @player1.deck.each do |cards|
        cards.drop(0)
      end
    end
  end
end
