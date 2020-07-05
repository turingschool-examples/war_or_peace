require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    first_pair_matches = @player1.deck.cards[0].rank === @player2.deck.cards[0].rank
    if (@player1.deck.cards[2] && @player2.deck.cards[2])
      second_pair_matches = @player1.deck.cards[2].rank === @player2.deck.cards[2].rank
    end
    if (first_pair_matches && second_pair_matches)
      return :mutually_assured_destruction
    elsif (first_pair_matches)
      return :war
    else
      return :basic
    end
  end


  def winner
    if type() == :mutually_assured_destruction
      return 'No Winner'
    end

    i = type() == :basic ? 0 : 2
    who_won = @player1.deck.cards[i].rank > @player2.deck.cards[i].rank
    winner = who_won ? @player1 : @player2
  end

  def pile_cards
    if type() == :mutually_assured_destruction
      @player1.deck.cards.slice!(0,3)
      @player2.deck.cards.slice!(0,3)
    elsif type() == :war
      player1Cards = @player1.deck.cards.slice!(0,3)
      player2Cards = @player2.deck.cards.slice!(0,3)

      @spoils_of_war.concat(player1Cards)
      @spoils_of_war.concat(player2Cards)
    else
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war)
  end
end
