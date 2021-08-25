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
      @player1.deck.cards.first.rank > @player2.deck.cards.first.rank
        winner = @player1
    else
       winner = @player2
    end
  end

  def pile_cards
    spoils_of_war << @player1.deck.cards[0]
    spoils_of_war << @player2.deck.cards[0]
    @player1.deck.cards.shift
    @player2.deck.cards.shift
  end

  def award_spoils(winner)
    spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
    end
    spoils_of_war.clear
    require "pry"; binding.pry
  end

end
