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

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p  "The players today are Megan and Aurora."
    p  "Type 'GO' to start the game!"
    p "------------------------------------------------------------------" 
  
    input = gets.chomp.upcase
    if input == "GO"
      p "The game has started!"
      count = 0
      loop do
        count += 1
        winner
        
        pile_cards
          if player1.has_lost? == true || player2.has_lost? == true || count == 1000000
            break
          else award_spoils(winner)
            if @spoils_of_war.length == 2 && type == :basic
              p "Turn #{count}: #{winner.name} won 2 cards"
            elsif @spoils_of_war.length == 6 && winner != "No Winner"
              p "Turn #{count}: WAR - #{winner.name} won 6 cards"
            else p "Turn #{count}: *mutually assured destruction* 6 cards removed from"
              p "play"
            end
        @spoils_of_war.clear
        end
      end
    end

    if player1.deck.cards.length == 0
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.deck.cards.length == 0
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else p "---- DRAW ----"
    end
 end

 def rank_of_card_at(index)
     if cards.length < 3 && index == 2
       return nil
     else @cards[index].rank
   end
 end
end