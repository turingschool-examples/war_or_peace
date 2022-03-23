class Turn
  # require 'rspec'
  # require './lib/deck'
  # require './lib/card'
  # require '.lib/player'

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      # require 'pry'; binding.pry
      return :basic
    elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && (player1.deck.cards[2].rank == player2.deck.cards[2].rank)
      return :mutually_assured_destruction
    else
      return :war
    end
  end

  def winner
    turn_type = ""
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      # require 'pry'; binding.pry
      turn_type = :basic
    elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && (player1.deck.cards[2].rank == player2.deck.cards[2].rank)
      turn_type = :mutually_assured_destruction
    else
      turn_type = :war
    end

    if turn_type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        return player1
      else
        return player2
      end
    elsif turn_type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        return player1
      else
        return player2
      end
    else
      return "No Winner"
    end

  end



end
