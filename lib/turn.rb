class Turn

  attr_reader :spoils_of_war,
              :player1,
              :player2

  def initialize(player1, player2)
    @spoils_of_war = []
    @player1 = player1
    @player2 = player2
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif type == :basic && player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
      player2
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif type == :war && player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
      player2
    elsif type == :mutually_assured_destruction
      p "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.first
      player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.first
      player2.deck.cards.shift
      spoils_of_war
    elsif type == :war
      spoils_of_war << player1.deck.cards.first
      player1.deck.cards.shift
      spoils_of_war << player1.deck.cards.first
      player1.deck.cards.shift
      spoils_of_war << player1.deck.cards.first
      player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.first
      player2.deck.cards.shift
      spoils_of_war << player2.deck.cards.first
      player2.deck.cards.shift
      spoils_of_war << player2.deck.cards.first
      player2.deck.cards.shift
      spoils_of_war
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.cards.shift
      end
      3.times do
        player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    winner.deck.cards << spoils_of_war
    winner.deck.cards.flatten!
  end

end
