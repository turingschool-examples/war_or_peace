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

      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
        player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war
      else :basic
      end

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      # This is considered a draw and the top card is put on the back
      # of the deck
      :draw
    else :basic
    end

  end

  def winner
    # this method determines the winner of the turn.
    if type == :basic
      # if the turn has a type of :basic, it returns whichever player has
      # a higher rank_of_card_at(0)
      @winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      # if the turn has a type of :war, the winner is whichever player has
      # a higher rank_of_card_at(2)
      @winner = player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else
      # if the turn has a type of :mutually_assured_destruction, the method
      # returns No Winner.
      return "No Winner"
    end
  end

  def pile_cards
  # when this method is called, cards are sent from the players' decks
  # into the @spoils_of_war:
    if type == :basic
      pile_basic
    elsif type == :war
      pile_war
    elsif type == :mutually_assured_destruction
      pile_mutually_assured_destruction
    elsif type == :draw # shuffle deck otherwise will often end in draw.
      # What fun is that?
      pile_draw
    else
      p "Whoops! Something went wrong here!"
    end
  end

  def pile_basic
    # for a :basic turn, each player sends one card (the top card) to
    # the spoils pile
    @spoils_of_war << @player1.deck.cards[0]
    @player1.deck.remove_card
    @spoils_of_war << @player2.deck.cards[0]
    @player2.deck.remove_card
  end

  def pile_war
    # for a :war turn, each player sends three cards (the top three
    # cards) to the spoils pile
    @player1.deck.cards[0..2].each { |card| @spoils_of_war << card }
    3.times { @player1.deck.remove_card }
    @player2.deck.cards[0..2].each { |card| @spoils_of_war << card }
    3.times { @player2.deck.remove_card }
  end

  def pile_mutually_assured_destruction
    # for a :mutually_assured_destruction turn, each player removes
    # three cards from play (the top three cards in their deck). These
    # cards are not sent to the spoils pile, they are simply removed from
    # each players’ deck.
    3.times { @player1.deck.remove_card }
    3.times { @player2.deck.remove_card }
  end

  def pile_draw
    @player1.deck.cards.shuffle! # alternatively, could use #rotate method
    @player2.deck.cards.shuffle! # alternatively, could use #rotate method
  end

  def award_spoils
    # this method adds each of the cards in the @spoils_of_war array to
    # the winner of the turn.
    @spoils_of_war.each { |spoils| @winner.deck.add_card(spoils) }
  end


end
