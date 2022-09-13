class Turn
  attr_reader :player1, :player2
  attr_accessor :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def basic_turn?
    @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
  end

  def war_turn?
    @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
  end

  def m_a_d_turn?
    player1_first_card = @player1.deck.rank_of_card_at(0)
    player2_first_card = @player2.deck.rank_of_card_at(0)
    player1_third_card = @player1.deck.rank_of_card_at(2)
    player2_third_card = @player2.deck.rank_of_card_at(2)

    (player1_first_card == player2_first_card) && (player1_third_card == player2_third_card)
  end

  def type
    if card_count_over_three? && m_a_d_turn?
      :mutually_assured_destruction
    elsif (card_count_over_three? && basic_turn?) || (card_count_under_three? && basic_turn?)
      :basic
    elsif (card_count_over_three? && war_turn?) || (card_count_under_three? && war_turn?)
      :war
    end
  end

  def winner
    case type
    when :basic
      basic_turn_winner
    when :war
      war_turn_winner
    else
      'No Winner'
    end
  end

  def pile_cards
    case type
    when :basic
      send_two_to_spoils
    when :war
      send_six_to_spoils
    when :mutually_assured_destruction
      remove_six_cards
    end
  end

  def award_spoils(hand_winner)

    @spoils_of_war.each do |x|
      hand_winner.deck.add_card(x)
    end

    @spoils_of_war.clear
  end

  def card_count_over_three?
    @player1.deck.cards.length >= 3 && @player2.deck.cards.length >= 3
  end

  def card_count_under_three?
    @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
  end

  def remove_six_cards
    @player1.deck.cards.slice!(0, 3)
    @player2.deck.cards.slice!(0, 3)
  end

  def send_six_to_spoils
    @spoils_of_war.concat(@player1.deck.cards.shift(3), @player2.deck.cards.shift(3))
  end

  def send_two_to_spoils
    @spoils_of_war.push(@player1.deck.cards.shift, @player2.deck.cards.shift)
  end

  def basic_turn_winner
    p1_card = @player1.deck.rank_of_card_at(0)
    p2_card = @player2.deck.rank_of_card_at(0)

    if p2_card < p1_card
      @player1
    elsif p2_card > p1_card
      @player2
    end
  end

  def war_turn_winner
    if card_count_over_three?
      greater_card_at_two
    elsif player1.deck.cards.count < 3
      @player2
    else
      @player1
    end
  end

  def greater_card_at_two
    p1_card = @player1.deck.rank_of_card_at(2)
    p2_card = @player2.deck.rank_of_card_at(2)

    p2_card < p1_card ? @player1 : @player2
  end
end
