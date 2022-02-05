class Turn
  attr_reader :player1, :player2, :spoils_of_war, :cards_won, :remove_card

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      type = :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @player2
      end
    elsif type == :mutually_assured_destruction
      puts "No winner"
      @player1 && @player2
    else type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
      end
    end
  end

  def pile_cards
    if type == :basic
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
    elsif type == :mutually_assured_destruction
        3.times do
          player1.deck.remove_card
          player2.deck.remove_card
        end
    elsif type == :war
        3.times do
          @spoils_of_war << @player1.deck.remove_card
          @spoils_of_war << @player2.deck.remove_card
        end

    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
  end
end
