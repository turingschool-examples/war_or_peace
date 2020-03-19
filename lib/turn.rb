require 'pry'
class Turn

  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  # 3 types of turns: Basic, War, or mutually assured destruction
  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      return player1 unless player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
      player2
    elsif type == :war
      return player1 unless player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
      player2
    else
       "No Winner"
    end
  end
  #
  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]
      @spoils_of_war.flatten!

      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end

    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if type == :basic
      winner.deck.cards << spoils_of_war
    end
  end

end
