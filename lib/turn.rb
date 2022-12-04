class Turn 

  attr_reader :player1, 
              :player2 
  attr_accessor :spoils_of_war
  def initialize (player1, player2)
      @player1 = player1
      @player2 = player2
      @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
        :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        :basic
    end
  end

  def winner_basic
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
    end
  end
      
  def winner_war    
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
    elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
    end
  end

  def winner_mutually_assured_destruction
    return 'No Winner'
  end

  def winner
    return winner_mutually_assured_destruction if type == :mutually_assured_destruction
    return winner_basic if type == :basic
    return winner_war if type == :war
  end
  
  def pile_cards 
    if type == :mutually_assured_destruction
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :basic
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
    end
  end # => #Arr of @spoils_of_war based on conditions met

  def award_spoils(winner)
    require 'pry'; binding.pry
    winner.deck << @spoils_of_war
  end
end
