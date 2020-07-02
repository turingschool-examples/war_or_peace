class Turn
  attr_reader :spoils_of_war, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      type = :war
    else
      player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    end
  end

  def winner
    if self.type == :basic
      return basic_victory
    elsif
      self.type == :war
      return war_victory
    else
      "haven't gotten this far yet :P"
    end
  end

  def basic_victory
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player1
    else
      return player2
    end
  end

  def war_victory
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player1
    else
      return player2
    end
  end

  def mutually_assured_destruction_victory
    
  end

end
