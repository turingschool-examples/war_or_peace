class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end # def initialize

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
       player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic
    end
  end # def type

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      else
        winner = player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      else
        winner = player2
      end
    elsif type == :mutually_assured_destruction
      winner = "No Winner"
    end
  end # def winner

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.remove_card
      end
      3.times do
        spoils_of_war << player2.deck.remove_card
      end

    elsif type == :mutually_assured_destruction
      player1.deck.cards.slice!(0, 3)
      player2.deck.cards.slice!(0, 3)
    end
  end # def pile_cards

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards << spoils_of_war
      player1.deck.cards.flatten!
    elsif winner == player2
      player2.deck.cards << spoils_of_war
      player2.deck.cards.flatten!
    else
      return "No Winner"
    end
  end

end
