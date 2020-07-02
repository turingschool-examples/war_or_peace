class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return  player1
    else
      return  player2
    end
    if type == :war && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return  player1
    else
      return  player2
    end
  end

  def pile_cards
    #remove_card has two actions, it removes a card from the deck and it returns that card. The returned card is being shoveled in to the spoils_of_war empty array

    @spoils_of_war << player1.deck.remove_card
    @spoils_of_war << player2.deck.remove_card
  end

  def awards_spoils(winner)
    winner.deck.cards << spoils_of_war.shift(spoils_of_war.length)
    winner.deck.cards.flatten!

  end

end
