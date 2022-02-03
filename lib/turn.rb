require './lib/card'
require './lib/deck'
require './lib/player'

class Turn

  attr_accessor :player1, :player2, :spoils_of_war, :winner, :turn_type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = type
    @winner = winner
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      @turn_type = :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank != player2.deck.cards[2].rank
      @turn_type = :war
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      @turn_type = :mutually_assured_destruction
    else
      raise
    end
  end

  def winner
    if @turn_type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        @winner = player1
      elsif player1.deck.cards[0].rank < player2.deck.cards[0].rank
        @winner = player2
      end
    elsif @turn_type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        @winner = player1
      elsif player1.deck.cards[2].rank < player2.deck.cards[2].rank
        @winner = player2
      end
    elsif @turn_type == :mutually_assured_destruction
      @winner = "No Winner"
    end
  end

  def pile_cards
    if @turn_type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif @turn_type == :war
      3.times do |index|
        @spoils_of_war << player1.deck.cards[index]
        @spoils_of_war << player2.deck.cards[index]
      end
    elsif @turn_type == :mutually_assured_destruction
      3.times do
        (player1.deck.cards).shift
        (player2.deck.cards).shift
      end
    end
  end

  def award_spoils(winner)
    (@winner.deck.cards).push(*@spoils_of_war)
  end
end
