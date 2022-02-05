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

    if player1.deck.cards.count > 2 && player2.deck.cards.count > 2
      if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        :basic

      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction

      else
        :war
      end
    else
      if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        :basic
      end
    end

  end

  def winner
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      # player1.deck.cards[0].rank != player2.deck.cards[0].rank
      # binding.pry
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
      end

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)

      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      end

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      "No Winner"
    end
  end

  def pile_cards

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.shift

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
      player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
      player2.deck.cards.shift(3)

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      puts ":mad type"
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    # 'No Winner'
    end

  end

  def award_spoils(winner)
    # winner = turn.winner
    if winner.class != String
      winner.deck.cards.push(*@spoils_of_war)
      @spoils_of_war.clear
    else
      return false
    end
    # binding.pry
    # winner.deck.cards.shift
  end
end
# binding.pry
