require './lib/player'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end



  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return "MAD"

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return "war"

    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        return "basic"
    end
  end

  def winner

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      return @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      return @player2
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return "No winner"
    end

  end

  def pile_cards

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) || @player1.deck.rank_of_card_at(0).rank < @player2.deck.rank_of_card_at(0).rank

      return @spoils_of_war << @player1.deck.cards[0] << @player2.deck.cards[0]

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

      return @spoils_of_war << @player1.deck.card[0,1,2] << @player2.deck.card[0,1,2]
    end


  end

  def award_spoils

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1.deck.cards << @spoils_of_war
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2.deck.cards << @spoils_of_war
    end

  end


end
