#This class takes in two Player objects and handles the turn logic for the game.
class Turn
    attr_reader :player1, :player2, :spoils_of_war, :saved_type
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        saved_type = :nil
    end
    #This method determines the turn type.  Either a basic turn, a war turn, MAD, or it will automatically empty a player's deck if war happens while they have less than three cards in deck.
    def type
        if player1.deck.cards.count < 3 || player2.deck.cards.count < 3
            @saved_type = :game_over
            return :game_over
        end

        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            @saved_type = :basic
            return :basic
        else
            if player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
                @saved_type = :war
                return :war
            else
                @saved_type = :mutually_assured_destruction
                return :mutually_assured_destruction
            end
        end
    end
    #This method determines who wins the turn, based on the type of turn provided.
    def winner
        if self.type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                winner = player1.name
            else
                winner = player2.name
            end
        elsif self.type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                winner = player1.name
            else
                winner = player2.name
            end
        elsif self.type == :game_over
            if player1.deck.cards.count < 3
                winner = player2.name
            else
                winner = player1.name
            end
        else
            return "No Winner"
        end
    end
    #This method takes cards from the top of each player's deck depending on the type of round and either adds them to the spoils, or removes them from the game entirely.
    def pile_cards
        if self.type == :basic
            spoils_of_war.append(player1.deck.remove_card)
            spoils_of_war.append(player2.deck.remove_card)
        elsif self.type == :war
            3.times {spoils_of_war.append(player1.deck.remove_card)}
            3.times {spoils_of_war.append(player2.deck.remove_card)}
        elsif self.type == :mutually_assured_destruction
            3.times {player1.deck.remove_card}
            3.times {player2.deck.remove_card}
        else
            if winner == player2.name
                count = player1.deck.cards.count
                count.times {player1.deck.remove_card}
            else
                count = player2.deck.cards.count
                count.times {player2.deck.remove_card}
            end
        end
    end
    #This method, if the type of turn was basic or war, will give the won cards to the winner of the turn.
    def award_spoils
        if saved_type == :basic
            if spoils_of_war[0].rank > spoils_of_war[1].rank
                spoils_of_war.each do |card|
                    player1.deck.add_card(card)
                end
            else
                spoils_of_war.each do |card|
                    player2.deck.add_card(card)
                end
            end
        else
            if spoils_of_war[2].rank > spoils_of_war[5].rank
                spoils_of_war.each do |card|
                    player1.deck.add_card(card)
                end
            else
                spoils_of_war.each do |card|
                    player2.deck.add_card(card)
                end
            end
        end 
    end
end