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
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war.flatten!
      3.times { player1.deck.remove_card }
      @spoils_of_war << player2.deck.cards[0..2]
      @spoils_of_war.flatten!
      3.times { player2.deck.remove_card }
    elsif type == :mutually_assured_destruction
      3.times { player1.deck.remove_card }
      3.times { player2.deck.remove_card }
    end
  end

  def award_spoils(winner)
    if winner == player1
      @spoils_of_war.map do |spoil|
        player1.deck.cards << spoil
      end
    else
      @spoils_of_war.map do |spoil|
        player2.deck.cards << spoil
      end
    end
  end
end
