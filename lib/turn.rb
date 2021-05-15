class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # @type = :basic
  end

  def type
    p1card = player1.deck.rank_of_card_at(0)
    p2card = player2.deck.rank_of_card_at(0)
    p1card_war = player1.deck.rank_of_card_at(2)
    p2card_war = player1.deck.rank_of_card_at(2)
    if p1card != p2card
      return :basic
    elsif p1card == p2card && p1card_war != p2card_war
      return :war
    else
      return :mutually_assured_destruction
    end
  end

  def winner
    p1card = player1.deck.rank_of_card_at(0)
    p2card = player2.deck.rank_of_card_at(0)
    p1card_war = player1.deck.rank_of_card_at(2)
    p2card_war = player1.deck.rank_of_card_at(2)
    if p1card != p2card && p1card > p2card
      return @player1
    elsif p1card != p2card && p2card > p1card
      return @player2
    elsif p1card == p2card && p1card > p2card
      return @player1
    elsif p1card == p2card && p2card > p1card
      return @player2
    else
      return "No Winner"
    end
  end

end
