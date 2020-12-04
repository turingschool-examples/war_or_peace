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
    if @player1.deck.cards[0].rank != @player2.deck.cards[0]
       :basic
    elsif @player1.deck.cards[0] == @player2.deck.cards[0]
       :war
    elsif @player1.deck.cards[0] == @player2.deck.cards[2]
       :mutually_assured_destruction
    end
  end

  def winner

  end

  def pile_cards

  end

  def award_spoils(winner)

  end
end
