class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0)) == (player2.deck.rank_of_card_at(0)) &&
    (player1.deck.rank_of_card_at(2)) == (player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif (player1.deck.rank_of_card_at(0)) == (player2.deck.rank_of_card_at(0))
      :war
    else (player1.deck.rank_of_card_at(0)) != (player2.deck.rank_of_card_at(0))
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
    "nobody wins this round!"
      player1 != winner
      player2 != winner
    elsif type == :basic && (player1.deck.rank_of_card_at(0)) >
    (player2.deck.rank_of_card_at(0)) || type == :war &&
    (player1.deck.rank_of_card_at(2)) > (player2.deck.rank_of_card_at(2))
      player1
    elsif type == :basic && (player2.deck.rank_of_card_at(0)) >
    (player1.deck.rank_of_card_at(0)) || type == :war &&
    (player2.deck.rank_of_card_at(2)) > (player1.deck.rank_of_card_at(2))
      player2
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      3.times{spoils_of_war << player1.deck.cards.shift}
      3.times{spoils_of_war << player2.deck.cards.shift}
    else type == :mutually_assured_destruction
      3.times{player1.deck.cards.shift}
      3.times{player2.deck.cards.shift}
    end
  end

  def award_spoils
    if player1 == winner
      pile_cards
      spoils_of_war.shuffle!
      player1.deck.cards << spoils_of_war
      player1.deck.cards.flatten!
      spoils_of_war.clear
    elsif player2 == winner
      pile_cards
      spoils_of_war.shuffle!
      player2.deck.cards << spoils_of_war
      player2.deck.cards.flatten!
      spoils_of_war.clear
    end
  end
end
