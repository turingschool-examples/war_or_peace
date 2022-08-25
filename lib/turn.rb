class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
  
  def type
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      return :mutually_assured_destruction
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      return :war
    else
      return :basic
    end
  end
  
  def winner
    type_local_to_winner_method = type
  
    if type_local_to_winner_method == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        return @player1
      else
        return @player2
      end
    elsif type_local_to_winner_method == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        return @player1
      else
        return @player2
      end
    elsif type_local_to_winner_method == :mutually_assured_destruction
      return "No Winner"
    else
      return "Better grab your rubber duck, because you shouldn't see this message"
    end
  end
  
  def pile_cards
    type_local_to_pile_cards_method = type
    if type_local_to_pile_cards_method == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type_local_to_pile_cards_method == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type_local_to_pile_cards_method == :mutually_assured_destruction
      3.times do
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    end
  end
  
  def award_spoils(winner)
    @spoils_of_war.count.times do |element|
      winner.deck.cards << @spoils_of_war[element]
    end
    @spoils_of_war.clear
  end
end

























