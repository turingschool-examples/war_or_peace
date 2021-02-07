class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    end
  end

  def high_card_0
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def high_card_2
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    else
      player2
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :basic
      high_card_0
    elsif type == :war
      high_card_2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
    elsif type == :war
      3.times { @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card) }
    elsif type == :mutually_assured_destruction
        3.times { player1.deck.remove_card && player2.deck.remove_card }
    end
  end

  def award_spoils(winner)
    pile_cards
    spoils_of_war.each do |card|
      return false if winner == "No Winner"
      winner.deck.add_card(card)
    end
    spoils_of_war.clear
  end

end
