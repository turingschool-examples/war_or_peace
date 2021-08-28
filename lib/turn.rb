class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type # no change
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner # no change
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
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards #changes the decks. call after prev 2
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
      end
      3.times do
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.shuffle
    @spoils_of_war.size.times do
      winner.deck.cards << @spoils_of_war.shift
    end
  end
end
