# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'


class Turn
  attr_accessor :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) ? :basic : (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2) ? :war : :mutually_assured_destruction)
  end

  def winner
    if type == :basic
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) ? @player1.name : @player2.name
    elsif type == :war
      @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) ? @player1.name : @player2.name
    elsif type == :mutually_assured_destruction
      'No Winner'
    elsif @player1.deck.cards.length == 0 || @player1.deck.cards.length == 0
      "Game Over"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.first && @spoils_of_war << @player2.deck.cards.first
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0] && @spoils_of_war << @player1.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2] && @spoils_of_war << @player2.deck.cards[0] && @spoils_of_war << @player2.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2]
    end
  end

  def award_spoils(winner)
    if winner == 'Megan' && type == :basic
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(1)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq
    elsif winner == 'Aurora' && type == :basic
      @player2.deck.cards << @spoils_of_war
      @player1.deck.cards = @player1.deck.cards.drop(1)
      @player2.deck.cards = @player2.deck.cards.flatten.uniq
    elsif winner == 'Megan' && type == :war
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(3)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq
    elsif winner == 'Aurora' && type == :war
      @player2.deck.cards << @spoils_of_war
      @player1.deck.cards = @player1.deck.cards.drop(3)
      @player2.deck.cards = @player2.deck.cards.flatten.uniq
    elsif winner == 'No Winner' && type == :mutually_assured_destruction
      @player1.deck.cards = @player1.deck.cards.drop(3)
      @player2.deck.cards = @player2.deck.cards.drop(3)
    end
  end

end
