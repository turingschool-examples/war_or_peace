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
    @type ||= calculate_type
  end

  def calculate_type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2))
      :war
    else (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    end

  end

  def winner
    @winner ||= calculate_winner
  end

  def calculate_winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << (player1.deck.remove_card)
      @spoils_of_war << (player2.deck.remove_card)
    elsif type == :war
      3.times do @spoils_of_war << (player1.deck.remove_card)
      end
      3.times do @spoils_of_war << (player2.deck.remove_card)
      end
    else type == :mutually_assured_destruction
      player1.deck.cards.slice!(0, 3)
      player2.deck.cards.slice!(0, 3)
    end
  end

  def award_spoils(winner)
    if spoils_of_war != []
      winner.deck.cards << @spoils_of_war
      winner.deck.cards = winner.deck.cards.flatten
    end
  end
end
