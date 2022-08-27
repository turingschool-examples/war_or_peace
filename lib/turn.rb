class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
      if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        :basic
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
        :war
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
      #return the player with the highest ranking card at index position 0
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
      if type == :basic
      #each player will send one card (the top card) to the spoils pile
      # spoils_of_war = []
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
      # spoils_of_war
      end

      if type == :war
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
        spoils_of_war << player2.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end

    # elsif type == :war
    #   #each player will send 3 cards (the top 3 cards) to the spoils pile
    #
    # elsif type == :mutually_assured_destruction
    #   #each player will remove three cards from play (the top three cards in their deck).
    #   #These cards are NOT send to the spoils pile, they are simply removed from each players deck
  end

  def award_spoils
    @winner.deck.cards.concat(spoils_of_war)
    #research concat
    end
  end
