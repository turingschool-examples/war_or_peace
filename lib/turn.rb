class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end


  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
          player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war


    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic

    end
  end




  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      player2
    elsif player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      player2
    else
      "No Winner"
    end
  end





  def pile_cards

    # when this method is called, cards will be sent from the players’ decks
    # into the @spoils_of_war based on these rules...

    #   for a :basic turn, each player will send one card (the top card) to the
    #   spoils pile
    if type == :basic
      # require "pry"; binding.pry
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]

    #   for a :war turn, each player will send three cards (the top three cards)
    #   to the spoils pile
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]

    #   for a :mutually_assured_destruction turn, each player will remove three
    #   cards from play (the top three cards in their deck). These cards are not
    #   sent to the spoils pile, they are simply removed from each players’ deck.
    # elsif type == :mutually_assured_destruction
    #   @player1.deck.cards.slice![0..2]
    #   @player2.deck.cards.slice![0..2]
    end

  end

  def award_spoils
    # this method will add each of the cards in the @spoils_of_war
    # array to the winner of the turn.
    @spoils_of_war.each do |card|
      card.rank.add
    end
  end

end
