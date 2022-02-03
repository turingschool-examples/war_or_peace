class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    #do stuff[
    @spoils_of_war = []
    @type = :basic
    @player1 = player1
    @player2 = player2
  end

  def type()
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      @type = :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      @type = :mutually_assured_destruction
    else
      @type = :war
    end
  end

  def winner ()
    #determines who won the turn
  end

  def pile_cards ()
    #piles cards in @spoils_of_war
  end

  def award_spoils()
    #give the spoils to the winner
  end
end
