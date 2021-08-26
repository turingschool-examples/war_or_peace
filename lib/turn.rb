class Turn

  attr_reader :player1, :player2, :spoils_of_war, :type_of_turn

  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2

  end

#returns a type_of_turn: either :basic, :war, or :mutually_assured_destruction
  def type

  end

#determines the winner of the turn
  def winner

  end

#send cards from the players' decks into the @spoils_of_war
#depending on the type_of_turn.
  def pile_cards

  end

#add cards(ARRAY) in the @spoils_of_war to the winner of the turn
  def award_spoils

  end
end
