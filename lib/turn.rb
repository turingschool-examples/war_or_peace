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
    p  "No winner-------------------------------------------------------"
    #p "*mutually assured destruction* 6 cards removed from play"

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
    end #winner

   def pile_cards
      if type() == :war
         @spoils_of_war.concat(player1.deck.cards.slice!(0..2))
         @spoils_of_war.concat(player2.deck.cards.slice!(0..2))
      else type() == :basic
         @spoils_of_war << @player1.deck.remove_card
         @spoils_of_war << @player2.deck.remove_card
      end
    end

   def award_spoils(winner)
       if type() == :mutually_assured_destruction
         3.times do
           @player1.deck.remove_card
           @player2.deck.remove_card
         end

       elsif
         @spoils_of_war.shuffle!
         winner.deck.cards.concat(@spoils_of_war)
         @spoils_of_war = []
       end
    end #method award_spoils
end #class
