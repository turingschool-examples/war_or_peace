require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_reader :player1,
            :player2,
            :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = ""
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if @player1.has_lost? == true
      @winner = @player2
    elsif @player2.has_lost? == true
      @winner = @player1
    elsif self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else @winner = @player2
      end
    else "No Winner"
    end
  end

  def pile_cards
    @winner = self.winner
    if type == :mutually_assured_destruction
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    else
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils
    if @winner == player2 || @winner == player1
      @winner.deck.cards.concat @spoils_of_war
    else
      p "No spoils to award"
    end
    @spoils_of_war.clear
  end

end
