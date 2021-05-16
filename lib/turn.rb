class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_descruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

    def winner
      if self.type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
         return @player1
      elsif self.type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        return @player2
      elsif self.type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      elsif self.type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        return @player2
      elsif self.type == :mutually_assured_descruction
        return "No Winner, No Winner, No Chicken Dinner"
      end
    end
    def pile_cards
      if self.type == :basic
         spoils_of_war << player1.deck.remove_card
         spoils_of_war << player2.deck.remove_card
      elsif self.type == :war
        3.times do
          spoils_of_war << player1.deck.remove_card
          spoils_of_war << player2.deck.remove_card
        end
      elsif self.type == :mutually_assured_descruction
        3.times do
          player1.deck.remove_card
          player2.deck.remove_card
        end
      end
    end

    def award_spoils(winner)
      if spoils_of_war.size > 0
        spoils_of_war.each do |card|
          self.winner.deck.cards << card
        end
      end
    end

end
