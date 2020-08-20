require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'

class Turn

  attr_accessor :deck
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = Array.new
  end

  def type
    if player1.deck.rank_of_card(0) == player2.deck.rank_of_card(0) && player1.deck.rank_of_card(2) == player2.deck.rank_of_card(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card(0) == player2.deck.rank_of_card(0)
      :war
    else
      :basic
    end
  end

  def winner
    case type
    when :basic
      if player1.deck.rank_of_card(0) > player2.deck.rank_of_card(0)
        player1
      else
        player2
      end
    when :war
      if player1.deck.rank_of_card(2) > player2.deck.rank_of_card(2)
        player1
      else
        player2
      end
    when :mutually_assured_destruction
      "No Winner"
    else
      "Invalid game type"
    end
  end

  def pile_of_cards
    if type == :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    elseif type == :war
      spoils_of_war << player1.deck.cards.shift(3)
      spoils_of_war << player2.deck.cards.shift(3)
    else
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    end
    spoils_of_war
  end
end
