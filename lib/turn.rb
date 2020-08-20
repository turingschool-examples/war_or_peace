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
    elsif player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      return player1.name if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player2.name if player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
    elsif type == :war
      return player1.name if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player2.name if player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]
      @spoils_of_war.flatten!
      3.times {player1.deck.cards.shift}
      3.times {player2.deck.cards.shift}
    else
      3.times {player1.deck.cards.shift}
      3.times {player2.deck.cards.shift}
    end
  end

  def award_spoils(winner_arg)
    if winner_arg == player1.name
      (player1.deck.cards << @spoils_of_war).flatten!
      @spoils_of_war = []
    else
      (player2.deck.cards.push @spoils_of_war).flatten!
      @spoils_of_war = []
    end
  end


end
