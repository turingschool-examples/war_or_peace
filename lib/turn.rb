class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)

    @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) ? :mutually_assured_destruction : :war
  end

  def winner
    case self.type
      when :basic
        @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) ? @player1 : @player2
      when :war
        @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) ? @player1 : @player2
      when :mutually_assured_destruction
        "No Winner"
    end
  end

  def pile_cards
    case self.type
      when :basic
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      when :war
        3.times do
          @spoils_of_war << @player1.deck.remove_card
          @spoils_of_war << @player2.deck.remove_card
        end
      when :mutually_assured_destruction
        3.times do
          @player1.deck.remove_card
          @player2.deck.remove_card
        end
    end
  end

  def award_spoils
    self.winner.deck.cards + @spoils_of_war if @spoils_of_war != []
  end

end
