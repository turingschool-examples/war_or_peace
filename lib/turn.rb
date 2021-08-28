class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

# why would turn.type block this from working???
def winner
    if type == :mutually_assured_destruction
      'no winner'
    elsif type == :war
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @player1
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @player2
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        @player2
      end
    end
  end
end

#basic each player will send top card to the spoils pile
#war each player will send top 3 cards to spoils pile
#mutually_assured_destruction each player remove 3 cards from deck. This needs to be destructive and not go to spoils pile 
  def pile_cards
  end

  def award_spoils(winner)
  end

end
