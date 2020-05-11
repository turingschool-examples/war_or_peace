class Turn

  attr_reader :player1, :player2, :spoils_of_war, :winner, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner_helper
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner_helper
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        win = @player1.name
      else
        @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
        win = @player2.name
      end
    end
    if type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        win = @player1.name
      elsif
        @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
        win = @player2.name
      end
    end
    if type == :mutually_assured_destruction
      "No Winner"
    end
    win
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.concat([@player1.deck.cards[0]])
      @spoils_of_war.concat([@player2.deck.cards[0]])
      @player1.deck.cards.slice!(0)
      @player2.deck.cards.slice!(0)
      if @player1.deck.cards.size < 1
        exit
      elsif @player2.deck.cards.size < 1
        exit
      else
      end
      @spoils_of_war.flatten! #Flattens array down to one level
    elsif type == :war
      @spoils_of_war.concat([@player1.deck.cards[0..2]])
      @spoils_of_war.concat([@player2.deck.cards[0..2]])
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
      if @player1.deck.cards.size < 1
        exit
      elsif @player2.deck.cards.size < 1
        exit
      else
      end
      @spoils_of_war.flatten! #Flattens array down to one level
    else type == :mutually_assured_destruction
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    if winner == @player1.name
      player_temp = @player1.deck.cards.concat(@spoils_of_war)
      player_temp.flatten!
      @spoils_of_war = []
    elsif winner == @player2.name
      player_temp = @player2.deck.cards.concat(@spoils_of_war)
      @spoils_of_war = []
      player_temp.flatten!
    else
      "No Winner"
    end
    player_temp
  end

end
