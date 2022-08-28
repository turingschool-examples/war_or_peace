class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards.length < 3 && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
      :player1_lost
    elsif player2.deck.cards.length < 3 && (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
      :player2_lost
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) &&
      (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def pile_cards
    if type == :player1_lost
      spoils_of_war.concat(player1.deck.cards)
      player1.deck.cards.clear
    elsif type == :player2_lost
      spoils_of_war.concat(player2.deck.cards)
      player2.deck.cards.clear
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.cards.shift
        player2.deck.cards.shift
      end
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.cards.shift
        spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    end
  end

  def winner
    if type == :mutually_assured_destruction
      'No Winner'
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      player2
    elsif type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      player2
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war.shuffle!)
    spoils_of_war.clear
  end
end
