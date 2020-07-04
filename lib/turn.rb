class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    #As per Carson, mutually_asssured_destruction should be first bc it is most complicated, and basic last because it is most simple
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
       :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
       :war
    else
       :basic
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      then player1

    elsif type == :basic &&  player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      then player2

    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      then player1

    elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      then player2

    else type == :mutually_assured_destruction
      "No winner"
    end

  end

end
