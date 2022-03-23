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


end
