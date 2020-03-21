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
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end

    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      #each player adds one card to spoils
      #this deletes one card from player's deck
      @spoils_of_war << player1.deck.cards.first
      @spoils_of_war << player2.deck.cards.first
      player1.deck.cards.shift
      player2.deck.cards.shift
    elsif type == :war
      #each player send 3 cards to spoils
      #this deletes three cards from player's deck
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
    #each player removes three cards to the side
      player1.deck.delete_at(0..2)
      player2.deck.delete_at(0..2)
    end
  end

  def award_spoils(winner)
  end
end
