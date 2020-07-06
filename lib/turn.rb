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

  def start
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
        :mutually_assured_destruction
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
      :war
    # elsif (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
    #   :basic
    else
      :basic
    # else
    #   puts "Game Over"
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      else
        winner = player2
      end
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      else
        winner = player2
      end
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times { player1.deck.remove_card }
      3.times { player2.deck.remove_card }
      # For some reason this is putting out "3" when I enter it into pry, but the rest of it is still working sooo I'm sticking with it.
    elsif type == :war
      3.times { @spoils_of_war << player1.deck.remove_card }
      3.times { @spoils_of_war << player2.deck.remove_card }
    elsif type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
    @spoils_of_war.clear
  end

end
