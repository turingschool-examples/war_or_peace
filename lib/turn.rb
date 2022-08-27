class Turn 
  attr_reader :player1, 
              :player2
              
  attr_accessor :spoils_of_war, 
                :type, 
                :pile_cards

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
 
  def type 
 
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
       @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner 
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        @player2
      end
    elsif type == :war 
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
        @player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end 
  end


  def pile_cards
    if type == :basic 
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war 
      3.times do 
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end 
    end 
  end
end