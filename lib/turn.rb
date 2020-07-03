class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) &&
       (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        player2
      end
    elsif type == :mutually_assured_destruction
        "No Winner"
      end
    end

  def pile_cards
    if type == :basic
      spoils_of_war.push(player1.deck.cards.shift)
      spoils_of_war.push(player2.deck.cards.shift)
    elsif type == :war
      spoils_of_war.push(*player1.deck.cards.shift(3))
      spoils_of_war.push(*player2.deck.cards.shift(3))
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end
# add each of the cards in @spoils_of_war to the winner of the turn
  def award_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.cards.push(card)
    end
  end 
end
