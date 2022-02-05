require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      :basic

    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank !=player2.deck.cards[2].rank
      :war
      
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank

      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        player1
      elsif player1.deck.cards[0].rank < player2.deck.cards[0].rank
        player2
      end

    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank != player2.deck.cards[2].rank

      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        player1
      elsif player1.deck.cards[2].rank < player2.deck.cards[2].rank
        player2
      end

    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      puts 'No winner'
    end
  end

  def pile_cards

    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.shift

    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
      player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
      player2.deck.cards.shift(3)

    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    'No Winner'
    end

  end

  def award_spoils(winner)
    # winner = turn.winner
    winner.deck.cards.push(*@spoils_of_war)
    @spoils_of_war.clear
    # winner.deck.cards.shift
  end
end
# binding.pry
