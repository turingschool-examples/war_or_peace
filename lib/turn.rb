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

    players = [@player1, @player2]

    # war_pile_cards = @spoils_of_war.flatten

    if type == :basic
      # require "pry"; binding.pry
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]


    elsif type == :war
      # @spoils_of_war << player1.deck.cards[0..2]
      # @spoils_of_war << player2.deck.cards[0..2]

      players.map do |player|
        @spoils_of_war << player.deck.cards[0]
        @spoils_of_war << player.deck.cards[1]
        @spoils_of_war << player.deck.cards[2]
    end


    elsif type == :mutually_assured_destruction
      @player1.deck.cards.slice![0..2]
      @player2.deck.cards.slice![0..2]
    end
  end

  def award_spoils
    require "pry"; binding.pry
    # this method will add each of the cards in the @spoils_of_war
    # array to the winner of the turn.
      winner.deck.cards << @spoils_of_war

  end

end
