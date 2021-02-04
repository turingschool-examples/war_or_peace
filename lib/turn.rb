class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    if cards_match_at(0) && cards_match_at(2)
      :mutually_assured_destruction
    elsif cards_match_at(0)
      :war
    else
      :basic
    end
  end

  def mutually_assured_destruction?
    type == :mutually_assured_destruction
  end

  def war?
    type == :war
  end

  def winner
    if mutually_assured_destruction?
      'No Winner'
    elsif war?
      compare_card_at(2) < 0 ? player1 : player2
    else
      compare_card_at(0) < 0 ? player1 : player2
    end
  end

  def pile_cards
    if mutually_assured_destruction?
      3.times {
        player1.deck.remove_card
        player2.deck.remove_card
      }
    elsif war?
      3.times {
        spoils_of_war << player1.deck.remove_card unless player1.has_lost?
        spoils_of_war << player2.deck.remove_card unless player2.has_lost?
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

  def player_stats
    puts "player1's cards: #{player1.num_cards} || player2's cards: #{player2.num_cards}"
  end

  def valid_game?
    !player1.has_lost? && !player2.has_lost?
  end

  private
  def cards_match_at(index)
    player1.card_rank_at(index) == player2.card_rank_at(index)
  end

  def compare_card_at(index = 0)
    player1.card_rank_at(index) <=> player2.card_rank_at(index)
  end
end
