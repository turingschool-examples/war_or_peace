class Turn

  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner_helper
  end



  def type
    if (@player1.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) && @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end


  def winner_helper
    if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      win = @player1
    elsif
      @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
      win = @player2
    else
      win = "No Winner"
    end
    win
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.concat(@player1.deck.cards[0])
      @spoils_of_war.concat(@player2.deck.cards[0])
      @player1.deck.cards.slice!(0)
      @player2.deck.cards.slice!(0)
    elsif type == :war
      @spoils_of_war.concat(@player1.deck.cards[0..2])
      @spoils_of_war.concat(@player2.deck.cards[0..2])
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    else type == :mutually_assured_destruction
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
      @spoils_of_war = []
    end

  end

  def award_spoils(winner)
    if winner == @player1
      player_temp = @player1.deck.cards.concat(@spoils_of_war)
      @spoils_of_war = []
    else
      # binding.pry
      player_temp = @player2.deck.cards.concat(@spoils_of_war)
      @spoils_of_war = []
    end
    player_temp
  end

end
