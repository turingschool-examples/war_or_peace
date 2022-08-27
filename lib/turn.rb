class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic
      basic_winner
    end
  end

  def basic_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    if type == :basic
      # require "pry"; binding.pry
      spoils_of_war << @player1.deck.cards.first
      @player1.deck.remove_card
      spoils_of_war << @player2.deck.cards.first
      @player2.deck.remove_card
    end
  end
  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
  end
end
