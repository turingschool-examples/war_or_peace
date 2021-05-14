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
    if player1.first_card != player2.first_card
      :basic
    elsif player1.first_card == player2.first_card && player1.third_card == player2.third_card
      :mutually_assured_destruction
    elsif player1.first_card == player2.first_card
      :war
    end
  end

  def winner
    if type == :basic
      if player1.first_card > player2.first_card
        player1
      else player2
      end
    elsif type == :war
      if player1.third_card > player2.third_card
        player1
      else player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif type == :war
      @spoils_of_war << player1.deck.cards(0..2)
      @spoils_of_war << player2.deck.cards(0..2)
    elsif type == :mutually_assured_destruction
      player1.deck.cards.delete(0..2)
      player1.deck.cards.delete(0..2)
    end
  end
end
