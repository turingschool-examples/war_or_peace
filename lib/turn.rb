class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2) &&
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :mutually_assured_destruction
    else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    # require "pry"; binding.pry
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
      player2
    end
  end

  def pile_cards
    require "pry"; binding.pry
    if :basic
      @spoils_of_war << player1.deck.cards[0] &&
      @spoils_of_war << player2.deck.cards[0]
    elsif :war
      @spoils_of_war << player1.deck.cards[0..2] &&
      @spoils_of_war << player2.deck.cards[0..2]
    else :mutually_assured_destruction
      3.times do player1.deck |card|
        player1.deck.remove_card
      end
      3.times do player2.deck |card|
        player2.deck.remove_card
      end
    end
  end
end
