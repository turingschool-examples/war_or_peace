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
    if @player1.deck.cards.first.rank != @player2.deck.cards.first.rank
      :basic
    elsif @player1.deck.cards.first.rank == @player2.deck.cards.first.rank
      :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards.first.rank > @player2.deck.cards.first.rank
        winner = @player1
      else
        winner = @player2
      end
    elsif type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        winner = @player1
      else
        winner = @player2
      end
    end
    winner
  end

  def pile_cards
    if type == :basic
      spoils_of_war << @player1.deck.cards[0]
      @player1.deck.cards.shift
      spoils_of_war << @player2.deck.cards[0]
      @player2.deck.cards.shift
    elsif type == :war
      3.times do
        spoils_of_war << @player1.deck.cards[0]
        @player1.deck.cards.shift
        spoils_of_war << @player2.deck.cards[0]
        @player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
      # require "pry"; binding.pry
    end
    spoils_of_war.clear
  end
end
