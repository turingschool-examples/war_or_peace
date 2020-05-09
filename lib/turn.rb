class Turn

  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner_helper
  end



  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else @player1.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end


  def winner_helper
    @player1.deck.cards[0].rank
    # p @player2.deck.cards[0].rank
    if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      win = @player1
    else
      win = @player2
    end
    win
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.cards.slice!(0)
      @player2.deck.cards.slice!(0)
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
    elsif type == :mutually_assured_destruction
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    else
      # p "no valid types"
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards.concat(@spoils_of_war)
      # @spoils_of_war = []
    else
      @player2.deck.cards.concat(@spoils_of_war)
      # @spoils_of_war = []
    end

  end

end
