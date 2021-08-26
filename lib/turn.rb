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
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    else
      puts "Error: unable to determine type"
    end
  end

  def winner
    if type == :mutually_assured_destruction
      return "No Winner"
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    else
      puts "Error: no type"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war
    elsif type == :war
      [0,1,2].each do | three |
        @spoils_of_war << player1.deck.cards[three]
        @spoils_of_war << player2.deck.cards[three]
      end
      @spoils_of_war
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
      "No type"
    end
  end
end
