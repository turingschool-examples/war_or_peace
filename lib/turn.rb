class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = determine_winner
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def determine_winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      player2
    end
  end

  def pile_cards

    @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
  end

  def award_spoils
    @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    @spoils_of_war.clear
  end
end
