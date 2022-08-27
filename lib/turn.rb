class Turn 
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 
    @spoils_of_war = []

  end 

  def type 
    # require 'pry'; binding.pry 
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic 
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)  
      :mutually_assured_destruction
      
    end 
     

  end 

  # def spoils_of_war
  #   spoils_of_war =[]
  # end 
  def pile_cards
    if type == :basic 
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war 
      @spoils_of_war << 3.times{player1.deck.remove_card}
      @spoils_of_war << 3.times{player2.deck.remove_card}

    elsif type == :mutually_assured_destruction
      3.times{player1.deck.remove_card}
      3.times{player2.deck.remove_card}
    end 

  end 
  def award_spoils

  end 

  def winner
    if type == :basic 
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) 
        player1 
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0) 
        player2
      end
    elsif type == :war 
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) 
        player1 
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2) 
        player2
      end
    elsif type == :mutually_assured_destruction
        'No winner'
    end
  end 
end
