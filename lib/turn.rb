class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    # type: a turn is :basic, :war, or :mutually_assured_destruction.
    # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
    # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
    # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            return :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
                #does not account for if both decks have exactly 1 or exactly 2 cards
                return :war
            elsif @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
                return :mutually_assured_destruction
            else
                return :war
            end
                
        end
        
        #this was my previous version. It gave errors if either deck had less than 3 cards
        # elsif 
        #     @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        #     return :mutually_assured_destruction
        # elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        #     return :war
        # end
    end

# winner: this method will determine the winner of the turn.
# if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.
    def winner
        #change self.type to a variable so we don't have to call the function over and over agin
        if self.type == :basic 
            return @player1 if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            return @player2 if @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        # this would still have a problem if they both had exactly two cards left and had a war on the 2nd to last card
        elsif self.type == :war 
            if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
                return @player1 if @player1.deck.cards.length > @player2.deck.cards.length
                return @player2 if @player1.deck.cards.length < @player2.deck.cards.length
            else
                return @player1 if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                return @player2 if @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
            end
        elsif self.type == :mutually_assured_destruction
            "No Winner"        
        end
    end


# pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
# for a :basic turn, each player will send one card (the top card) to the spoils pile
# for a :war turn, each player will send three cards (the top three cards) to the spoils pile
# for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.

#maybe adjust to call spoils and give spoils the winner inside this function
    def pile_cards
        if self.type == :basic
            @spoils_of_war << @player1.deck.cards[0]
            #binding.pry
            @spoils_of_war << @player2.deck.cards[0]
            #binding.pry 
        elsif self.type == :war
            @spoils_of_war.concat(@player1.deck.cards[0..2])
            #binding.pry
            @spoils_of_war.concat(@player2.deck.cards[0..2])
            
        else
          
           "No Spoils"

        end

    end

    # award_spoils: this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
    # need to fix this. I either need to delete the cards in this method, which requires calling a bunch of shit again,
    # or I need to have a variable for the winner.


     def award_spoils
        who_won = self.winner
        if self.type == :basic
            @player1.deck.remove_card
            @player2.deck.remove_card
            who_won.deck.cards.concat(spoils_of_war)
        elsif self.type == :war
            3.times do @player1.deck.remove_card
            end
            3.times do @player2.deck.remove_card
            end
            who_won.deck.cards.concat(spoils_of_war)
        else
             3.times do @player1.deck.remove_card
           end
           3.times do @player2.deck.remove_card
           end
            "No Spoils Awarded"
         end

    end
end