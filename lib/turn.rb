# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'


class Turn
  attr_accessor :player1, :player2, :spoils_of_war

  $turn_number = 0
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    $turn_number += 1
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
       :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1.name
      else
        @player2.name
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1.name
      else
        @player2.name
      end
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.first + @spoils_of_war << @player2.deck.cards.first
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0] && @spoils_of_war << @player1.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2] && @spoils_of_war << @player2.deck.cards[0] && @spoils_of_war << @player2.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2]
    end
  end

  def award_spoils(winner)
    if winner == 'Megan'
      if type == :basic
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(1)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq.shuffle
    else
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(3)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq.shuffle
    end
    elsif winner == 'Aurora'
      if type == :basic
      @player2.deck.cards << @spoils_of_war
      @player1.deck.cards = @player1.deck.cards.drop(1)
      @player2.deck.cards = @player2.deck.cards.flatten.uniq.shuffle
      elsif type == :war
        @player2.deck.cards << @spoils_of_war
        @player1.deck.cards = @player1.deck.cards.drop(3)
        @player2.deck.cards = @player2.deck.cards.flatten.uniq.shuffle
      end
    elsif winner == 'No Winner' && type == :mutually_assured_destruction
      @player1.deck.cards = @player1.deck.cards.drop(3)
      @player2.deck.cards = @player2.deck.cards.drop(3)
    end
  end

end
