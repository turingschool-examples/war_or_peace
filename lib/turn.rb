class Turn
  attr_reader :player1, :player2, :spoils_of_war, :players

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    # @players = [@player1, @player2]
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    else
      :war
    end
  end
  # if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  #   :mutually_assured_destruction
  # elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
  #   :basic
  # else
  #   :war
  # end
  # end
  #   if @players.all? {|player| player.deck.cards.count >= 3}
  #     player1_card1 = @player1.deck.rank_of_card_at(0)
  #     player2_card1 = @player2.deck.rank_of_card_at(0)
  #     player1_card3 = @player1.deck.rank_of_card_at(2)
  #     player2_card3 = @player2.deck.rank_of_card_at(2)
  #     if player1_card1 == player2_card1 && player1_card3 == player2_card3
  #       return :mutually_assured_destruction
  #     elsif player1_card1 != player2_card1
  #       return :basic
  #     else
  #       return :war
  #     end
  #   elsif @players.any? {|player| player.deck.cards.count >= 1}
  #     player1_card1 = @player1.deck.rank_of_card_at(0)
  #     player2_card1 = @player2.deck.rank_of_card_at(0)
  #     if player1_card1 != player2_card1
  #       return :basic
  #     else
  #       return :no_cards
  #     end
  #   else
  #     return :no_cards
  #   end
  # end

  def winner
    if type == :basic && player.deck.rank_of_card_at(0) > player.deck.rank_of_card_at(0)
      player1
    elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      player2
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      player2
    else
      "No Winner"
    end
  end

  def pile_cards
  end
end
