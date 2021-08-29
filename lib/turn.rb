class Turn

  attr_reader :player1, :player2, :spoils_of_war, :type_of_turn, :winner_of_turn

  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

#returns type_of_turn - :basic, :war, or :mutually_assured_destruction
  def type

    if player1.deck.rank_of_cards_at(0) != player2.deck.rank_of_cards_at(0)
      @type_of_turn = :basic

    else
      if player1.deck.rank_of_cards_at(2) != player2.deck.rank_of_cards_at(2)
        @type_of_turn = :war
      else
        @type_of_turn = :mutually_assured_destruction
      end
    end



  end

#determines the winner of the turn
  def winner
    if type_of_turn == :basic

      if player1.deck.rank_of_cards_at(0) > player2.deck.rank_of_cards_at(0)
        @winner_of_turn = player1
      else
        @winner_of_turn = player2
      end

    elsif type_of_turn == :war

      if player1.deck.rank_of_cards_at(2) > player2.deck.rank_of_cards_at(2)
        @winner_of_turn = player1
      else
        @winner_of_turn = player2
      end

    else
      @winner_of_turn = "No Winner"
    end
  end

#send cards from the players' decks into the @spoils_of_war
#depending on the type_of_turn.
  def pile_cards

    if type_of_turn == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card

    elsif type_of_turn == :war
      3.times do
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player2.deck.cards[0]
        player1.deck.remove_card
        player2.deck.remove_card
      end

    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

#add cards(ARRAY) in the @spoils_of_war to the winner of the turn
  def award_spoils(winner_of_turn)


    if winner_of_turn == player1
      @spoils_of_war.each do |card_from_spoil|
        player1.deck.cards.append(card_from_spoil)
      end

#
    elsif winner_of_turn == player2
      @spoils_of_war.each do |card_from_spoil|
        player2.deck.cards.append(card_from_spoil)
      end

    end

  end



end
