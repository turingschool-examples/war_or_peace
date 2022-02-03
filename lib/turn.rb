class Turn
    attr_reader :player1, :player2, :spoils_of_war, :saved_type
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @saved_type = self.type
    end

    def type
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            return :basic
        else
            if player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
                return :war
            else
                return :mutually_assured_destruction
            end
        end
    end

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
        else
            return "No Winner"
        end
    end

    def pile_cards
        if self.type == :basic
            spoils_of_war.append(player1.deck.remove_card)
            spoils_of_war.append(player2.deck.remove_card)
        elsif self.type == :war
            3.times {spoils_of_war.append(player1.deck.remove_card)}
            3.times {spoils_of_war.append(player2.deck.remove_card)}
        else
            3.times {player1.deck.remove_card}
            3.times {player2.deck.remove_card}
        end
    end

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
        else saved_type == :war
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