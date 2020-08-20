class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if p1_card_rank != p2_card_rank
      :basic
    elsif p1_3rd_card_rank != p2_3rd_card_rank
      :war
    else
      :mutually_assured_destruction
    end
  end

  def p1_card_rank
    player1.deck.cards[0].rank
  end

  def p2_card_rank
    player2.deck.cards[0].rank
  end

  def p1_3rd_card_rank
    player1.deck.cards[2].rank
  end

  def p2_3rd_card_rank
    player2.deck.cards[2].rank
  end

  def winner
    if type == :basic
      return player1.name if p1_card_rank > p2_card_rank
      return player2.name if p1_card_rank < p2_card_rank
    elsif type == :war
      return player1.name if p1_3rd_card_rank > p2_3rd_card_rank
      return player2.name if p1_3rd_card_rank < p2_3rd_card_rank
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]
      @spoils_of_war.flatten!
    else
    end
  end

  def award_spoils(winner_arg)
    if winner_arg == player1.name
      (player1.deck.cards << @spoils_of_war).flatten!
      @spoils_of_war = []
    else
      (player2.deck.cards.push @spoils_of_war).flatten!
      @spoils_of_war = []
    end
  end


end
