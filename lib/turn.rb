class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    else
      type = :war 
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
      @spoils_of_war << player1.deck.cards.first
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards.first
      player2.deck.remove_card
    elsif type == :war
      player1.deck.cards.first(3).each do |card|
        @spoils_of_war << card
        player1.deck.remove_card(3)
      end
      player2.deck.cards.first(3).each do |card|
        @spoils_of_war << card
        player2.deck.remove_card(3)
      end
    elsif type == :mutually_assured_destruction
        player1.deck.remove_card(3)
        player2.deck.remove_card(3)
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
    end
    @spoils_of_war = []
  end
end
