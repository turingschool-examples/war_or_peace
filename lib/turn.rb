class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
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
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      else
        "No Winner"
      end

    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    spoils_of_war = []
    lost_cards = []
    if type == :basic
      spoils_of_war << player1.deck.cards[0]
      spoils_of_war << player2.deck.cards[0]
    elsif type == :war
      spoils_of_war << player1.deck.cards[0..2]
      spoils_of_war << player2.deck.cards[0..2]
    elsif type == :mutually_assured_destruction
      lost_cards << player1.deck.cards[0..2]
      lost_cards << player2.deck.cards[0..2]
    end
  end

  def award_spoils(winner)
    if type == :basic
      @spoils_of_war = pile_cards
      winner.deck.cards << @spoils_of_war
      player1.deck.cards.flatten!
      player2.deck.cards.flatten!
      #Makes sure the cards played are removed from players deck
      player2.deck.remove_card
      player1.deck.remove_card
    elsif type == :war
      @spoils_of_war = pile_cards
      winner.deck.cards << @spoils_of_war
      player1.deck.cards.flatten!
      player2.deck.cards.flatten!
      #Makes sure the cards played are removed from players deck
      3.times do
        player2.deck.remove_card
        player1.deck.remove_card
      end
    else
      #Makes sure the cards played are removed from players deck
      3.times do
        player2.deck.remove_card
        player1.deck.remove_card
      end
    end
  end
end
