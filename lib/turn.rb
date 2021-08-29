class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards.length <= 2 || @player2.deck.cards.length <= 2
      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        if @player1.deck.cards.length <= 2
          :player2_winner
        else
          :player1_winner
        end
      else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      end
    else
      if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
          :war
      else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      end
    end
  end

  def winner
    winner = []
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
    elsif type == :mutually_assured_destruction
      3.times {|card| @player1.deck.cards.delete_at(0)}
      3.times {|card| @player2.deck.cards.delete_at(0)}
    elsif type == :player1_winner
      @player2.deck.cards.clear
    else
      @player2.deck.cards.clear
    end
  end

  def award_spoils
    @spoils_of_war.shuffle!
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.cards.push(card)
      end
    else
      @spoils_of_war.each do |card|
        @player2.deck.cards.push(card)
      end
    end

    if type == :basic
      @player1.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
    elsif type == :war
      3.times {|card| @player1.deck.cards.delete_at(0)}
      3.times {|card| @player2.deck.cards.delete_at(0)}
    elsif type == :mutually_assured_destruction
      3.times {|card| @player1.deck.cards.delete_at(0)}
      3.times {|card| @player2.deck.cards.delete_at(0)}
    elsif type == :player1_winner
      @player2.deck.cards.clear
    else
      @player2.deck.cards.clear
    end
    
    @spoils_of_war.clear
  end

end
