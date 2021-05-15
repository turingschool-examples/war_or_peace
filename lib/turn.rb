class Turn

attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if player1.deck.cards.length > 2 && player2.deck.cards.length > 2

      if player1.deck.rank_of_card_at(0) ==   player2.deck.rank_of_card_at(0) &&
        player1.deck.rank_of_card_at(2) ==  player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif player1.deck.rank_of_card_at(0) ==  player2.deck.rank_of_card_at(0)
        :war
      else :basic
      end

    else :basic # if either player has 2 or less cards, only a basic turn is
      # called

    end

  end

  def winner
    # this method determines the winner of the turn.
    if type == :basic
      # if the turn has a type of :basic, it returns whichever player has
      # a higher rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = player1
      else
        @winner = player2
      end
    elsif type == :war
      # if the turn has a type of :war, the winner is whichever player has
      # a higher rank_of_card_at(2)
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1
      else
        @winner = player2
      end
    else
      # if the turn has a type of :mutually_assured_destruction, the method
      # returns No Winner.
      return "No Winner"
    end
  end

  def pile_cards
  #when this method is called, cards are sent from the players' decks
  # into the @spoils_of_war based on these rules:
    if type == :basic
      # for a :basic turn, each player sends one card (the top card) to
      # the spoils pile
      @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.remove_card
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.remove_card
    elsif type == :war
      # for a :war turn, each player sends three cards (the top three
      # cards) to the spoils pile
      @player1.deck.cards[0..2].each { |card| @spoils_of_war << card }
      3.times { @player1.deck.remove_card }
      @player2.deck.cards[0..2].each { |card| @spoils_of_war << card }
      3.times { @player2.deck.remove_card }
    elsif type == :mutually_assured_destruction
      # for a :mutually_assured_destruction turn, each player removes
      # three cards from play (the top three cards in their deck). These
      # cards are not sent to the spoils pile, they are simply removed from
      # each players’ deck.
      3.times { @player1.deck.remove_card }
      3.times { @player2.deck.remove_card }
    else
      p "Whoops! Something went wrong here!"
    end
  end

  def award_spoils
    # this method adds each of the cards in the @spoils_of_war array to
    # the winner of the turn.
    @spoils_of_war.each { |spoils| @winner.deck.add_card(spoils) }
  end


end
