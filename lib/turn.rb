class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2 
        @spoils_of_war = []
    end

    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
            :war
        else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        end
    end

    def winner 
        if type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2    
            end    
        elsif type == :war 
             if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                 player1
             else
                 player2
             end
        else
            type == :mutually_assured_destruction
            "No Winner" 
        end
    end

    def pile_cards 
        if type == :basic 
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times do
                spoils_of_war << player1.deck.remove_card
                spoils_of_war << player2.deck.remove_card
            end
            #  spoils_of_war << player1.deck.cards.shift(3)
            #  spoils_of_war << player2.deck.cards.shift(3)
            #  why does this code equal a nested array of 12 cards
        else type == :mutually_assured_destruction
            3.times do
                player1.deck.remove_card
                player2.deck.remove_card
            end
        end
    end

    def award_spoils(winner)
        winner.deck.cards.concat(@spoils_of_war)
    end


    def start
        puts "Welcome to War! (or Peace) This game will be played with 52 cards."
        puts "The players today are #{player1.name} and #{player2.name}."
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"
    
        user = gets.chomp
        if user == "GO"
            count = 0
            loop do
                count += 1
                winner
                pile_cards
                    if player1.has_lost? == true || player2.has_lost? == true || count == 1000000
                        break
                    
                    else
                       award_spoils(winner)
                       if @spoils_of_war.length == 2 && type == :basic 
                            puts "Turn #{count}: #{winner.name} won 2 cards"
                       elsif @spoils_of_war.length == 6 && winner != "No Winner"
                            puts "Turn #{count}: WAR - #{winner.name} won 6 cards"
                       else
                            puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
                       end

                        @spoils_of_war.clear
                    end
                
            end
        end
        
        if player1.deck.cards.length == 0
            puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        elsif player2.deck.cards.length == 0
            puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        else
            puts "---- DRAW ----"
        end
    end
end