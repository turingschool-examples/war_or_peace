require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader(:player1, :player2, :spoils_of_war)
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end


  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) && @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    case self.type
    when :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        return @player2
      end
    when :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        return @player2
      end
    when :mutually_assured_destruction
      return 'No Winner'
    end
  end


  def pile_cards
    case self.type
    when :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    when :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    when :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
      @spoils_of_war
    end
  end



  def award_spoils(winner)
    @spoils_of_war.size.times do
      winner.deck.cards << @spoils_of_war.shift
    end
    # if winner == player1
    #   player1.deck.cards << @spoils_of_war
    # elsif winner == player2
    #   player2.deck.cards << @spoils_of_war
    # end
    @spoils_of_war
  end



end
