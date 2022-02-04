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
end
# binding.pry
