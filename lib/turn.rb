class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type
    # require "pry"; binding.pry
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2))
      :war
    else (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    end

  end

  def winner
    # require "pry"; binding.pry

    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(player1.deck.cards.first, player2.deck.cards.first)
    elsif type == :war
      @spoils_of_war.push(player1.deck.cards[0..2], player2.deck.cards[0..2])
    else type == :mutually_assured_destruction
      return
      #deletes all 6 cards. doesn't push them into spoils
    end
  end

  def award_spoils(winner)
    winner.deck.cards.push(@spoils_of_war)
  end


end
