class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && ((@player1.deck.cards[2] == nil) || (@player2.deck.cards[2] == nil))
      if @player2.deck.cards[2] == nil
        @player2.has_lost? == true
      else @player1.has_lost? == true
      end
    else
      :basic
    end
  end

  def winner
    if type() == :basic
      if ((@player1.deck.rank_of_card_at(0).to_i) > (@player2.deck.rank_of_card_at(0).to_i))
         @player1
      else
         @player2
      end
    elsif type() == :war
      if ((@player1.deck.rank_of_card_at(2).to_i) > (@player2.deck.rank_of_card_at(2).to_i))
         @player1
      else
         @player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type() == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type() == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
      return @spoils_of_war.flatten!
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.shuffle!
    if !winner.is_a? String
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
      winner
    end
  end
end 
