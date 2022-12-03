   if turn.type == :game_over
        p "End of Game."
        # if @player1.has_lost? = true
        #     # p "Sorry, #{@player1.name}, try again next time! #{@player2.name} beat you!"
        #     # p "#{player1.name} : #{@player1.deck.cards.count}. #{player2.name} : #{@player2.deck.cards.count}"
        # elsif @player2.has_lost? = true 
        #     # p "Sorry, #{@player2.name}, try again next time! #{@player1.name} beat you!"
        #     # p "#{player1.name} : #{@player1.deck.cards.count}. #{player2.name} : #{@player2.deck.cards.count}"
        # end
    elsif turn.type == :basic
        # p "Turn #{number}: #{@turn.winner.name} won 2 cards. #{player1.name} : #{@player1.deck.cards.count}. #{player2.name} : #{@player2.deck.cards.count}"
        # if (@player1.deck.cards.count + @player2.deck.cards.count) != 52
        #     p "NOT 52-- IDENTIFY PROBLEM "
        # end
    elsif turn.type == :war1 
        # p "Turn #{number}:WAR - #{@turn.winner.name} won 6 cards. #{player1.name} : #{@player1.deck.cards.count}. #{player2.name} : #{@player2.deck.cards.count}"
        # if (@player1.deck.cards.count + @player2.deck.cards.count) != 52
        #     p "NOT 52-- IDENTIFY PROBLEM "
        # end
    elsif turn.type == :war2 
        # p "-----------------------------------------------------------------------------------------------------2"
    elsif turn.type == :war3 
        # p "-----------------------------------------------------------------------------------------------------3"
    elsif turn.type == :war4 
        # p "-----------------------------------------------------------------------------------------------------4"
    elsif turn.type == :mutually_assured_destruction
        # p "Turn #{number}: *mutually assured destruction* 6 cards removed from play----------------------------------------------------------------------------------"
        # require 'pry'; binding.pry
        # if (@player1.deck.cards.count + @player2.deck.cards.count) != 52
        #     p "NOT 52-- IDENTIFY PROBLEM "
        #     p "#{player1.name} : #{@player1.deck.cards.count}. #{player2.name} : #{@player2.deck.cards.count}"
    #     end
    # # end 



            # elsif (@player2.deck.cards.count < 3 && @player1.deck.cards.count < 3) && (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player2.deck.rank_of_card_at(-1) != @player1.deck.rank_of_card_at(-1))
          #                :bothplowcardwar