class Turn

attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
       :basic
     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
       :war
     end
   end
 end

public
 def winner
   if type() == :basic
     if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       return @player1
     else
       return @player2
     end
   end


    if type() == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    end

      if type() == :mutually_assured_destruction
        "No Winner."
      end
    end


    def pile_cards
      if type() == :basic
        @spoils_of_war << @player1.deck.cards[0]
        @spoils_of_war << @player2.deck.cards[0]

        @player1.deck.remove_card
        @player2.deck.remove_card

      elsif type() == :war
        @spoils_of_war << @player1.deck.cards[0..2]
        # @spoils_of_war << @player1.deck.cards(1)
        # @spoils_of_war << @player1.deck.cards(2)
        @spoils_of_war << @player2.deck.cards[0..2]
        # @spoils_of_war << @player2.deck.cards(1)
        # @spoils_of_war << @player2.deck.cards(2)

        @player1.deck.remove_card
        @player1.deck.remove_card
        @player1.deck.remove_card
        @player2.deck.remove_card
        @player2.deck.remove_card
        @player2.deck.remove_card

    elsif type() == :mutually_assured_destruction

      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
    end
  end

    def award_spoils
      turn.winner << @spoils_of_war
    end
