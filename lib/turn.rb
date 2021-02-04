class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1,player2)
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
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      player2
    end
  end

  def pile_cards
    @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      # require "pry"; binding.pry
      winner.deck.cards << card
    end
    @spoils_of_war.clear
  end
end
