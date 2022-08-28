class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && 
    @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    turn = :mutually_assured_destruction  
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      turn = :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      turn = :basic
    
    end


  end

  def winner
    if @player1.deck.rank_of_card_at(2) == nil
      winner = player2
    elsif @player2.deck.rank_of_card_at(2) == nil
      winner = player1
    elsif type == :basic &&
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       player1
    elsif type == :basic && 
      @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      winner = player2
    elsif type == :war &&
      @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      winner = player1
    elsif type == :war && 
      @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      winner = player2
    elsif type == :mutually_assured_destruction 
      "No Winner"
    end
  end 

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :mutually_assured_destruction
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
    end 
  end
  def award_spoils(winner) 
    winner.deck.cards.concat(@spoils_of_war)  
  end  
end