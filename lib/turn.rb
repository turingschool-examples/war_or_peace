class Turn
  attr_reader :spoils_of_war, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      type = :war
    else
      player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    end
  end

  def winner
    if type == :basic
      basic_victory
    elsif
      type == :war
      war_victory
    else
      type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def basic_victory
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def war_victory
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    else
      player2
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    (winner.deck.cards << @spoils_of_war).flatten!
  end

end
