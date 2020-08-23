require "pry"

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
    @type = type
  end

  def turn_type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @turn_type = :war
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) &&
          (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @turn_type = :mutually_assured_destruction
    end
  end

  def winner
    if @turn_type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = player1
      elsif player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        @winner = player2
      end
    elsif @turn_type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1
      elsif player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        @winner = player2
      end
    elsif @turn_type == :mutually_assured_destruction
      @winner = "No Winner"
    end
  end

  def pile_cards
    @spoils_of_war << player1.deck.cards[0]
    player1.deck.cards.shift
    @spoils_of_war << player2.deck.cards[0]
    player2.deck.cards.shift
  end

  def awards_spoils(winner)
    if player1 == winner
      player1.deck.cards << spoils_of_war[0]
      player1.deck.cards << spoils_of_war[1]
    else
      player2.deck.cards << spoils_of_war[1]
      player2.deck.cards << spoils_of_war[0]
    end
  end

 end
