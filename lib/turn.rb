class Turn
  attr :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3
      player1_first_card = @player1.deck.cards[0].rank
      player2_first_card = @player2.deck.cards[0].rank
      player1_third_card = @player1.deck.cards[2].rank
      player2_third_card = @player2.deck.cards[2].rank
      
      if player1_first_card == player2_first_card && player1_third_card == player2_third_card
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      end
    elsif @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
      if  @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      end
    end
  end

  def winner
    if type == :basic
      p1_card = @player1.deck.rank_of_card_at(0)
      p2_card = @player2.deck.rank_of_card_at(0)
      case p2_card <=> p1_card
      when -1
        @player1
      when 1
        @player2
      end
    elsif type == :war
      if player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
        p1_card_2 = @player1.deck.rank_of_card_at(2)
        p2_card_2 = @player2.deck.rank_of_card_at(2)
        case p2_card_2 <=> p1_card_2
        when -1
          @player1
        when 1
          @player2
        end
      elsif player1.deck.cards.count < 3
        @player2
      elsif player2.deck.cards.count < 3
        @player1
      else
        'something in :winner logic'
      end
    elsif type == :mutually_assured_destruction
      'No Winner'
    else
      'somthing in winner method'
    end
  end

  def pile_cards
    case type
    when :basic
      p1_card = @player1.deck.cards.shift
      p2_card = @player2.deck.cards.shift
      @spoils_of_war.push(p1_card, p2_card)
    when :war
      p1_cards = @player1.deck.cards.shift(3)
      p2_cards = @player2.deck.cards.shift(3)
      @spoils_of_war.concat(p1_cards, p2_cards)
    when :mutually_assured_destruction
      @player1.deck.cards.slice!(0, 3)
      @player2.deck.cards.slice!(0, 3)
    end
  end

  def award_spoils(hand_winner)
    hand_winner.deck.cards.concat(@spoils_of_war)
  end
end
