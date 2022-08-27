class Turn 
  attr_reader :player1, 
              :player2, 
              :spoils_of_war 

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&
      ((@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner 
    if type == :mutually_assured_destruction
      puts "No Winner"
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        player2
      end
    else
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    elsif type == :war
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
      @spoils_of_war.flatten! 
    else type == :basic 
      @spoils_of_war << @player1.deck.cards.shift()
      @spoils_of_war << @player2.deck.cards.shift()
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    @spoils_of_war = []
  end
 
end











