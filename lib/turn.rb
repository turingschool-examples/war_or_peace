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
    #  p "No winner"
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
        3.times do
          @player1.deck.remove_card
          @player2.deck.remove_card
        end
      elsif type() == :war
         @spoils_of_war.concat(player1.deck.cards.slice!(0..2))
         @spoils_of_war.concat(player2.deck.cards.slice!(0..2))
        # 3.times do
        #   @spoils_of_war << player1.deck.remove_card
        #   @spoils_of_war << player2.deck.remove_card
        # end
      else type() == :basic
         @spoils_of_war << @player1.deck.remove_card
         @spoils_of_war << @player2.deck.remove_card
      end #og if statement
    end #class

   def award_spoils(winner)
     #if type() == :basic || type() == :war
       @spoils_of_war.shuffle!
       #winner.deck.cards.concat(@spoils_of_war)
       until @spoils_of_war.empty? do
         winner.deck.add_card(@spoils_of_war.shift)
       end

       #@spoils_of_war = []
     #else
      # nil
    # end
   end #method award_spoils
end #class
