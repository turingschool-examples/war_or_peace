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
    else
      :war
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player1
    elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      return player2
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player1
    elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      return player2
    else
      return 'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      spoils_of_war << player1.deck.cards.take(3)
      spoils_of_war << player2.deck.cards.take(3)
    else
      3.times do
        player1.deck.cards.shift
        player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
    spoils_of_war.clear()
  end



end
