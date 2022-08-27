class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    #   "No Winner"

    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    :war
    else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic
      basic_winner
    elsif type == :war
      war_winner
    # else type == :mad
    #   mad
    end
  end

  def basic_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       @player1
    else
      @player2
    end
  end

  def war_winner

    if player1.deck.rank_of_card_at(2) <= player2.deck.rank_of_card_at(2)
      player2
    else
      player1
    end
  end

  # def mad_winner
  # end

  def pile_cards
    if type == :basic
      # require "pry"; binding.pry
      spoils_of_war << @player1.deck.cards.first
      @player1.deck.remove_card
      spoils_of_war << @player2.deck.cards.first
      @player2.deck.remove_card
    # elsif type == :war
    #   spoils_of_war << player1.deck.card(2)
    #   player1.deck.remove_card
    #   spoils_of_war << player1.deck.card.first
    #   player1.deck.remove_card
    #   spoils_of_war << player2.deck.card(2)
    #   player2.deck.remove_card
    #   spoils_of_war << player2.deck.card.first
    #   player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
  end



end
