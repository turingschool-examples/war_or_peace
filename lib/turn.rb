class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank
      if player1.deck.cards[2].rank == player2.deck.cards[2].rank
        :mutually_assured_destruction
      else
        :war
      end
    else
      :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        winner = player1
      else
        winner = player2
      end
    elsif type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        winner = player1
      else
        winner = player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.remove_card
      end
      3.times do
        spoils_of_war << player2.deck.remove_card
      end
    else
      3.times do
        spoils_of_war << player1.deck.remove_card
      end
      3.times do
        spoils_of_war << player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards << spoils_of_war
      player1.deck.cards.flatten!
    elsif winner == player2
      player2.deck.cards << spoils_of_war
      player2.deck.cards.flatten!
    else
      spoils_of_war = []
    end
  end

end
