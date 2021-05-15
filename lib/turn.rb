class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @spoils_of_war = []
    @player1 = player1
    @player2 = player2
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :basic
      winner_basic
    elsif type == :war
      winner_war
    else type == :mutually_assured_destruction
      p 'No Winner'
    end
  end

  def winner_basic
    p1card = @player1.deck.rank_of_card_at(0)
    p2card = @player2.deck.rank_of_card_at(0)
    if p1card > p2card
      @player1
    else
      @player2
    end
  end

  def winner_war
    p1card = @player1.deck.rank_of_card_at(2)
    p2card = @player2.deck.rank_of_card_at(2)
    if p1card > p2card
      @player1
    else
      @player2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      war1 = @spoils_of_war <<  @player1.deck.cards.slice!(0..2)
      war1.flatten!
      war2 = @spoils_of_war << @player2.deck.cards.slice!(0..2)
      war2.flatten!
    else type == :mutually_assured_destruction
      3.times{@player1.deck.remove_card}
      3.times{@player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    award = winner.deck.cards << @spoils_of_war
    award.flatten!
  end
end
