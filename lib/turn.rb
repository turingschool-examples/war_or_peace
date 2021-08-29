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
    return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    return :war if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    return :mutually_assured_destruction if @player1.deck.rank_of_card_at(0,2) == @player2.deck.rank_of_card_at(0,2)
  end

  def winner
    case self.type
    when  :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    when :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    when :mutually_assured_destruction
      return "No winner"
    end
  end

  def pile_of_cards
    case self.type
      # each player sends the top card to the spoils pile
    when :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
      # each player sends 3 top 3 cards to the spoils pile
    when :war
      @spoils_of_war << player1.deck.cards.concat([0,1,2])
      @spoils_of_war << player2.deck.cards.concat([0,1,2])
      # each player will remove the top 3 cards from the deck array
    when :mutually_assured_destruction
      player1.deck.cards.remove_card([0,1,2])
      player2.deck.cards.remove_card([0,1,2])
    end
    @spoils_of_war
  end


#this method adds each of the cards in the @spoils_of_war to the winner
   def award_spoils
     @spoils_of_war.size.times do
     winner.deck.cards << @spoils_of_war.shift
   end

  end
end
