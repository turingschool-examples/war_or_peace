class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if self.type == :mutually_assured_destruction
      'No Winner'
    elsif self.type == :war
      return player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player2
    else
      return player1 if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player2
    end
  end

  def pile_cards
    if self.type == :mutually_assured_destruction
      3.times {
        player1.deck.remove_card
        player2.deck.remove_card
      }
    elsif self.type == :war
      3.times {
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      }
    else
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils(win)
    return false if win == 'No Winner'
    spoils_of_war.map {|c| win.deck.add_card(c)}
    @spoils_of_war = []
  end

end
