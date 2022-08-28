class Turn 
  attr_reader :turn_results
  attr_accessor :award_spoils, :winner, :spoils_of_war, :player1, :player2, :empty_spoils 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 
    # @spoils_of_war = []

  end 


  def type 
    # require 'pry'; binding.pry 
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)  
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic 
    end 
     

  end 

  # def spoils_of_war
  #   spoils_of_war =[]
  # end 
  def pile_cards
  
    if type == :basic 
 
      @spoils_of_war = player1.deck.remove_card + player2.deck.remove_card
      # @spoils_of_war + player2.deck.remove_card
      
      
    elsif type == :war 
      # @spoils_of_war << 3.times{player1.deck.remove_card}
      # @spoils_of_war << 3.times{player2.deck.remove_card}
 
      @spoils_of_war = player1.deck.cards.shift(3) + player2.deck.cards.shift(3)
      
      # spoils_of_war + player1.deck.remove_card
      # spoils_of_war + player2.deck.remove_card
      # spoils_of_war + player2.deck.remove_card
      # spoils_of_war + player2.deck.remove_card
      #spoils_of_war.flatten!

     #maybe use player.1.deck.cards.shift(3)


    elsif type == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      # 3.times{player1.deck.remove_card}
      # 3.times{player2.deck.remove_card}
    end 
  end 

  # def empty_me
  #   pile_cards = []
  #   spoils_of_war = []
  # end

  def award_spoils(winner)
    # require 'pry'; binding.pry 
    # player1_winnings = []
    # player2_winnings = []
    if winner == player1
      # @player1.deck.cards << spoils_of_war
      (player1.deck.cards << @spoils_of_war).flatten!
      # player1_winnings << spoils_of_war
      # player1_winnings
     
      # @player1.deck 
    elsif winner == player2
      # @player2.deck.cards << spoils_of_war
      (player2.deck.cards << @spoils_of_war).flatten!
      # player2_winnings << spoils_of_war
      # player2_winnings
      
    #   # @player2.deck 
  
    end 
# turn.winner.deck gives us the winner's deck 
    # winner.deck = []
    # winner.deck << @spoils_of_war

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

  # def winner_status
  #   if player1.has_lost? == true || 
  #     puts "true" 
  #   else
  #     puts "false"
  #   end 


  # end 


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


