class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    #in this method, it is possible to only create one other condition to be met, then the last else could be the last turn type.
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    else
      :mutually_assured_destruction
    end

  end

  def winner(type)
    return player1 if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
    return player2 if type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
    return player1 if type == :war && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
    return player2 if type == :war && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
    return "No Winner" if type == :mutually_assured_destruction
  end

  def pile_cards
    #remove_card has two actions, it removes a card from the deck and it returns that card. The returned card is being shoveled in to the spoils_of_war empty array
    if type == :basic

      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war.flatten!
    elsif type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    else type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end

  end

  def awards_spoils(winner)
    winner.deck.cards << spoils_of_war.shift(spoils_of_war.length)
    winner.deck.cards.flatten!
  end

end
