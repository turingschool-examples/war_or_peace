class Turn
  attr_reader :player1, :player2
  attr_accessor :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if card_count_over_three?
      player1_first_card = @player1.deck.cards[0].rank
      player2_first_card = @player2.deck.cards[0].rank
      player1_third_card = @player1.deck.cards[2].rank
      player2_third_card = @player2.deck.cards[2].rank

      if m_a_d?
        :mutually_assured_destruction
      elsif player1_first_card != player2_first_card
        :basic
      elsif player1_first_card == player2_first_card
        :war
      end
    elsif @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
      if  @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
        :basic
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      end
    end
  end

  def winner
    case type
    when :basic
      p1_card = @player1.deck.rank_of_card_at(0)
      p2_card = @player2.deck.rank_of_card_at(0)

      if p2_card < p1_card
        @player1
      elsif p2_card > p1_card
        @player2
      else
        'no one wins'
      end
    when :war
      if player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
        p1_card = @player1.deck.rank_of_card_at(2)
        p2_card = @player2.deck.rank_of_card_at(2)

        if p2_card < p1_card
          @player1
        elsif p2_card > p1_card
          @player2
        else
          'no one wins'
        end
      elsif player1.deck.cards.count < 3
        @player2
      elsif player2.deck.cards.count < 3
        @player1
      else
        'something in :winner logic'
      end

    when :mutually_assured_destruction
      'No Winner'
    else
      'else clause in winner method'
    end
  end

  def pile_cards
    case type
    when :basic
      @spoils_of_war.push(@player1.deck.cards.shift, @player2.deck.cards.shift)
    when :war
      @spoils_of_war.concat(@player1.deck.cards.shift(3), @player2.deck.cards.shift(3))
    when :mutually_assured_destruction
      @player1.deck.cards.slice!(0, 3)
      @player2.deck.cards.slice!(0, 3)
    end
  end

  def award_spoils(hand_winner)
    hand_winner.deck.cards.concat(@spoils_of_war)
    @spoils_of_war.clear
  end

  def card_count_over_three?
    @player1.deck.cards.length >= 3 && @player2.deck.cards.length >= 3
  end

  def m_a_d?
    player1_first_card = @player1.deck.cards[0].rank
    player2_first_card = @player2.deck.cards[0].rank
    player1_third_card = @player1.deck.cards[2].rank
    player2_third_card = @player2.deck.cards[2].rank
    
    (player1_first_card == player2_first_card) && (player1_third_card == player2_third_card)
  end
end
