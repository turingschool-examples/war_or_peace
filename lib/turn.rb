class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
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

  def rank_in_spoils(index)
    spoils_of_war[index].rank
  end

  def winner
    if spoils_of_war.length == 2 && rank_in_spoils(0) > rank_in_spoils(1)
      player1
    elsif spoils_of_war.length == 2 && rank_in_spoils(0) < rank_in_spoils(1)
      player2
    elsif spoils_of_war.length == 6 && rank_in_spoils(4) > rank_in_spoils(5)
      player1
    elsif spoils_of_war.length == 6 && rank_in_spoils(4) < rank_in_spoils(5)
      player2
    elsif spoils_of_war.length == 0
      'No Winner'
    end
  end

  def award_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    spoils_of_war.clear
  end
end
