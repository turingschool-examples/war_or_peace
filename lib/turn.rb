class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    current_type = type
    if current_type == :mutually_assured_destruction
      "No Winner"
    elsif current_type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif current_type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    current_type = type
    if current_type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.remove_card
      @player2.deck.remove_card

    elsif current_type == :war
      i = 0
      while i < 3
        @spoils_of_war << @player1.deck.cards[0]
        @spoils_of_war << @player2.deck.cards[0]
        @player1.deck.remove_card
        @player2.deck.remove_card
        i += 1
      end

    else
      j = 0
      while j < 3
        @player1.deck.remove_card
        @player2.deck.remove_card
        j += 1
      end
    end
  end

  def award_spoils(winner)
    winning_player = winner
    current_type = type
    if current_type != :mutually_assured_destruction
      @spoils_of_war.each do |card|
        winning_player.deck.cards << card
        end
    end
  end
end
