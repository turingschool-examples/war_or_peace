class Turn
  attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @spoils_of_war = []
    end

    def type
      if(self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0)) && (self.player1.deck.rank_of_card_at(2) == self.player2.deck.rank_of_card_at(2))
        :mutually_assured_destruction
      elsif self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0)
        :war
      elsif self.player1.deck.rank_of_card_at(0) != self.player2.deck.rank_of_card_at(0)
        :basic
      end
    end

    def winner
      if self.type == :basic && self.player1
        #don't know what to return yet
        return
      elsif self.type == :war &&
        #don't know what to return yet
        return
      elsif self.type == :mutually_assured_destruction
        "No Winner"
      end
    end

    def pile_cards
      if self.type == :basic
        @spoils_of_war << self.player1.deck.cards.shift
        @spoils_of_war << self.player2.deck.cards.shift
      elsif self.type == :war
        @spoils_of_war << self.player1.deck.cards.shift(3)
        @spoils_of_war << self.player2.deck.cards.shift(3)
      elsif self.type == :mutually_assured_destruction
        self.player1.deck.cards.shift(3)
        self.player2.deck.cards.shift(3)
      end
    end

    def award_spoils(winner)
      winner.deck << @spoils_of_war
    end

end
