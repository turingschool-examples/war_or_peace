class Turn
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = Deck.new([])
  end

  # a little cheeky alias perhaps
  def spoils_of_war
    return @spoils_of_war.cards
  end

  def type
    turn = :basic
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      turn = :war
      if @player1.deck.cards.length >= 3 && @player2.deck.cards.length >= 3
        if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
          turn = :mutually_assured_destruction
        end
      end
    end
    @type_pre_pile = turn
    return turn
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    end

    if self.type == :war
      if @player1.deck.cards.length >= 3 && @player2.deck.cards.length >= 3
        if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          return @player1
        else
          return @player2
        end

      else
        # if turn type == war but one deck has <3 cards, the winner is whoever has more cards
        if @player1.deck.cards.length > @player2.deck.cards.length
          return @player1
        else
          return @player2
        end

      end

    end

    if self.type == :mutually_assured_destruction
      return 'No Winner!'
    end

  end

  def pile_cards
    # THIS IS WHAT I NEED TO WORK ON TOMORROW, PROBABLY CAN BE COMPLETELEY REFACTORED
    if self.type == :basic
      @spoils_of_war.add_card_to_bottom(player1.deck.remove_card_from_top)
      @spoils_of_war.add_card_to_bottom(player2.deck.remove_card_from_top)
    elsif self.type == :war
      # pile top 3 cards from both decks, if decks have < 3 cards pile all
    else

    end

  end

end
