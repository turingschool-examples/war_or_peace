class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
     if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
       return :basic
     elsif
       @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
       return :war
     else
       @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
       return :mutually_assured_destruction
     end
   end

    def winner
      if  @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      elsif @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
        return @player2
      elsif @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        return @player1
      elsif @player1.deck.cards[2].rank < @player2.deck.cards[2].rank
        return @player2
      else
        "Mutually Assured Destruction, No winner."
      end
    end

    def pile_cards
      if type 

    end

    # def spoils_of_war
    #
    # end


  end
