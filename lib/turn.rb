class Turn 
  attr_reader :turn_results
  attr_accessor :award_spoils, :winner, :spoils_of_war, :player1, :player2, :empty_spoils 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 

  end 


  def type 
    if player1.deck.cards.count<=2 && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      :basic 
    elsif player2.deck.cards.count<=2 && player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
      :basic 
    elsif player1.deck.cards.count<=2 && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :autowin1
    elsif player2.deck.cards.count<=2 && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :autowin2
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)  
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic 
    end
  end 

  def pile_cards
  
    if type == :basic 
      @spoils_of_war = player1.deck.remove_card + player2.deck.remove_card
    elsif type == :war 
      @spoils_of_war = player1.deck.cards.shift(3) + player2.deck.cards.shift(3)
    elsif type == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
    end 
  end 

  def award_spoils(winner)
    if winner == player1
      (player1.deck.cards << @spoils_of_war).flatten!
    elsif winner == player2
      (player2.deck.cards << @spoils_of_war).flatten!
    end 
  end 

  def turn_results
    if type == :basic 
      puts "#{winner.name} won 2 cards"
    elsif type == :war
      puts "WAR - #{winner.name} won 6 cards"
    else #type==:destruction
      puts "MAD 6 cards removed from play"
    end
  end

  def print_deck
    puts "#{player1.name} has #{player1.deck.cards.count} cards and the first is rank: #{player1.deck.cards[0].rank}"  
    puts "#{player2.name} has #{player2.deck.cards.count} cards and the first is rank: #{player2.deck.cards[0].rank}"
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


