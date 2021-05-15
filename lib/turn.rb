class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&  (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war = [@player1.deck.remove_card, @player2.deck.remove_card]
    elsif type == :war
      @spoils_of_war = [
        @player1.deck.remove_card,
        @player1.deck.remove_card,
        @player1.deck.remove_card,
        @player2.deck.remove_card,
        @player2.deck.remove_card,
        @player2.deck.remove_card
      ]
    else
      count = 0
      loop do
        count += 1
        @player1.deck.remove_card
        @player2.deck.remove_card
        if count == 3
          break
        end
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.map do |card|
      winner.deck.add_card(card)
    end
    @spoils_of_war.clear
  end
end
