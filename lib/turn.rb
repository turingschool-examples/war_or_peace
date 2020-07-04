require 'pry'
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
      if type() == :mutually_assured_destruction
        # @player1.deck.cards.delete_at(0..2)
        # @player2.deck.cards.delete_at(0..2)
        @player1.deck.cards.shift(3)
        @player2.deck.cards.shift(3)

        # 3.times do
        #   @player1.deck.cards.remove_card
        #
        # end
        # 3.times do
        #   @player2.deck.cards.remove_card
        # end
      elsif type() == :war
        @spoils_of_war.concat(player1.deck.cards.slice!(0..2))
        @spoils_of_war.concat(player2.deck.cards.slice!(0..2))
      else type() == :basic
        @spoils_of_war << @player1.deck.cards.slice!(0)
        @spoils_of_war << @player2.deck.cards.slice!(0)
        #@spoils_of_war.concat(player1.deck.cards.slice!(0))
        #@spoils_of_war.concat(player2.deck.cards.slice!(0))
      end
   end

   def award_spoils(winner)
     if type() == :basic || type() == :war
       @spoils_of_war.shuffle!
       winner.deck.cards.concat(@spoils_of_war)
       @spoils_of_war = []
     else
       nil
     end
   end #method award_spoils
end #class



# add an if to basic, if first cardvalue=
#need a turn counter
#may be trouble with @winner as an instance variable
#def winner use @player.name
