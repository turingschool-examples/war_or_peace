class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0] != @player2.deck.cards[0]
      :basic
    else #@player1.deck[0] == @player2.deck[0]
      if @player1.deck.cards[2] != @player2.deck.cards[2]
        :war
      else #@player1.deck[2] == @player2.deck[2]
        :mutually_assured_destruction
      end
    end
  end
end
