class Turn
  attr :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.has_lost? || @player2.has_lost?
      :endgame
    elsif @player1.deck.cards.count <= 2 || @player2.deck.cards.count <= 2

      p1_card_0 = @player1.deck.rank_of_card_at(0)
      p2_card_0 = @player2.deck.rank_of_card_at(0)

      if p1_card_0 == p2_card_0
        :endgame
      else
        :basic
      end

    else
      p1_card_0 = @player1.deck.rank_of_card_at(0)
      p2_card_0 = @player2.deck.rank_of_card_at(0)

      p1_card_2 = @player1.deck.rank_of_card_at(2)
      p2_card_2 = @player2.deck.rank_of_card_at(2)

      if p1_card_0 == p2_card_0 && p1_card_2 == p2_card_2
        :mutually_assured_destruction
      elsif p1_card_0 == p2_card_0
        :war
      elsif p1_card_0 != p2_card_0
        :basic
      end
    end
  end

  def winner
    if type == :endgame
      'something fishy'
    elsif type == :basic
      p1_card = @player1.deck.cards[0].rank
      p2_card = @player2.deck.cards[0].rank
      case p2_card <=> p1_card
      when -1
        @player1
      when 1
        @player2
      end
    elsif type == :war
      p1_card_2 = @player1.deck.rank_of_card_at(2)
      p2_card_2 = @player2.deck.rank_of_card_at(2)
      case p2_card_2 <=> p1_card_2
      when -1
        @player1
      when 1
        @player2
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

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war) if winner
  end
end
