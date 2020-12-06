class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
       :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
       :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        player1
      elsif @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
        player2
      end

    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
          # if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        player1
      elsif @player1.deck.cards[2].rank < @player2.deck.cards[2].rank
        player2
      end

    elsif type == :mutually_assured_destruction
        "No Winner"
      end
  end

  def pile_cards
    #need to fix this method/winner. when war is called all cards get sent
      if type == :mutually_assured_destruction
      2.times do
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end
      if type == :war
      3.times do
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end
      if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards = winner.deck.cards.flatten
  end
end
