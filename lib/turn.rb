class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end 

  def type
    if @player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && 
      @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war 
    end 
  end 

  def winner 
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else 
        player2
      end 
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else 
        @player2
      end 
    else type == :mutually_assured_destruction
      "No Winner"
    end 
  end 
  
  def pile_cards
    if type == :mutually_assured_destruction
      3.times do @player1.deck.remove_card
        end 
      3.times do @player2.deck.remove_card
      end 
    elsif type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    else type == :war
      3.times do @spoils_of_war << @player1.deck.remove_card
      end 
      3.times do @spoils_of_war << @player2.deck.remove_card
      end 
    end 
  end 
end 