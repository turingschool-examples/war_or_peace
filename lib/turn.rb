class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @c1_0 = @player1.deck.rank_of_card_at(0)
    @c1_1 = @player1.deck.rank_of_card_at(1)
    @c1_2 = @player1.deck.rank_of_card_at(2)
    @c2_0 = @player2.deck.rank_of_card_at(0)
    @c2_1 = @player2.deck.rank_of_card_at(1)
    @c2_2 = @player2.deck.rank_of_card_at(2)
  end

  def type
    if (@c1_0 == @c2_0) && (@c1_2 == @c2_2)
      :mutually_assured_destruction
    elsif @c1_0 == @c2_0
      :war
    else @c1_0 != @c2_0
      :basic
    end
  end

  def winner
    if type == :basic
      if @c1_0 > @c2_0
        @player1
      else
        @player2
      end
    elsif type == :war
      if @c1_2 > @c2_2
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
      @spoils_of_war.push(@player1.deck.cards[0], @player2.deck.cards[0])
      @player1.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
    elsif type == :war
      @spoils_of_war.push(@player1.deck.cards[0],
                          @player1.deck.cards[1],
                          @player1.deck.cards[2],
                          @player2.deck.cards[0],
                          @player2.deck.cards[1],
                          @player2.deck.cards[2])
      3.times {|card| @player1.deck.cards.delete_at(0)}
      3.times {|card| @player2.deck.cards.delete_at(0)}
    else
      3.times {|card| @player1.deck.cards.delete_at(0)}
      3.times {|card| @player2.deck.cards.delete_at(0)}
    end
  end

  def award_spoils
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.cards.push(card)
      end
    else
      @spoils_of_war.each do |card|
        @player2.deck.cards.push(card)
      end
    end

    @spoils_of_war.clear
  end

end
