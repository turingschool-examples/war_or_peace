class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
    @turn = nil
  end

  def type
    p1_rank_0 = player1.deck.rank_of_card_at(0)
    p2_rank_0 = player2.deck.rank_of_card_at(0)
    p1_rank_2 = player1.deck.rank_of_card_at(2)
    p2_rank_2 = player2.deck.rank_of_card_at(2)
    if p1_rank_0 == p2_rank_0
      if p1_rank_2 == p2_rank_2
        @turn = :mutually_assured_destruction
        return :mutually_assured_destruction
      else
        @turn = :war
        return :war
      end
    else
      @turn = :basic
      return :basic
    end
  end

  def winner
    if @turn == :basic
      p1_rank_0 = player1.deck.rank_of_card_at(0)
      p2_rank_0 = player2.deck.rank_of_card_at(0)
      if p1_rank_0 > p2_rank_0
        return player1
      else
        return player2
      end
    elsif @turn == :war
      p1_rank_2 = player1.deck.rank_of_card_at(2)
      p2_rank_2 = player2.deck.rank_of_card_at(2)
      if p1_rank_2 > p2_rank_2
        return player1
      else
        return player2
      end
    elsif @turn == :mutually_assured_destruction
      return "No Winner"
    else
      return "Must take a turn before deciding winner"
    end
  end

  def pile_cards
    if @turn == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @turn == :war
      @spoils_of_war.push(player1.deck.cards[0], player1.deck.cards[1], player1.deck.cards[2])
      @spoils_of_war.push(player2.deck.cards[0], player2.deck.cards[1], player2.deck.cards[2])
      (1..3).each do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif @turn == :mutually_assured_destruction
      (1..3).each do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
    @spoils_of_war.clear
  end
end
