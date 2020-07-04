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
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

   def winner
    if type() == :mutually_assured_destruction
      p "No winner"
    elsif type() == :basic
        if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
          @player1
        else @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
          @player2
         end
    elsif type() == :war
        if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          @player1
        else @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
          @player2
        end
      end
     end

   def pile_cards
      if type() == :basic
        @spoils_of_war << @player1.deck.cards.slice!(0)
        @spoils_of_war << @player2.deck.cards.slice!(0)
        #@spoils_of_war.concat(player1.deck.cards.slice!(0))
        #@spoils_of_war.concat(player2.deck.cards.slice!(0))
      elsif type() == :war
        @spoils_of_war.concat(player1.deck.cards.slice!(0..2))
        @spoils_of_war.concat(player2.deck.cards.slice!(0..2))
      else :mutually_assured_destruction
        3.times do
          @player1.deck.remove_card
        end
        3.times do
          @player2.deck.remove_card
        end
      end
   end

   def award_spoils(winner)
     @spoils_of_war.shuffle!
     winner.deck.cards.concat(@spoils_of_war)
     @spoils_of_war = []
   end
end



# add an if to basic, if first cardvalue=
#need a turn counter
#may be trouble with @winner as an instance variable
#def winner use @player.name
