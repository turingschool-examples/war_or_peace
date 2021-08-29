class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war


  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank &&
          @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
      :war
    else
      if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) &&
          (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
          :mutually_assured_destruction
      end
    end
  end

  def winner
    p type
    if type == :basic
      if (@player1.deck.cards[0].rank > @player2.deck.cards[0].rank)
        turn = Turn.new(player1, player2)
        winner = @player1
      else
        @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
        turn = Turn.new(player1, player2)
        winner = @player2
      end
    elsif type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        turn = Turn.new(player1, player2)
        winner = @player1
      else
        turn = Turn.new(player1, player2)
        winner = @player2
      end
    else type == :mutually_assured_destruction
      p "no winner"
      turn = Turn.new(player1, player2)
    end
  end

  def change_cards
    spoils_of_war << player1.deck.cards[0]
    player1.deck.remove_card
    if player1.deck.cards.count == 0
      p "#{player2.name} has won"
    end

    spoils_of_war << player2.deck.cards[0]
    player2.deck.remove_card
    if player2.deck.cards.count == 0
      p "#{player1.name} has won"
    end
  end

  def pile_cards
    if type == :basic
      change_cards
    elsif type == :war
      3.times do
        change_cards
      end
    else type == :mutually_assured_destruction
      winner = nil
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    if type == :war || :basic
      spoils_of_war.each do |spoil|
        winner.deck.cards << spoil
        if player1.deck.cards.count == 0
          p "#{player2.name} has won"
          break
        end
      end
    else type == :mutually_assured_destruction
      p "This is working"
    end
    spoils_of_war.clear
  end
end
