class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = determine_winner
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

  def determine_winner
    high_card_0 = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    high_card_2 = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2

    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      high_card_2
    elsif type == :basic
      high_card_0
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
    elsif type == :war
      3.times { @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card) }
    elsif type == :mutually_assured_destruction
        3.times { player1.deck.remove_card && player2.deck.remove_card }
      false
    end
  end

  def award_spoils
    @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
    @spoils_of_war.clear
  end
end
