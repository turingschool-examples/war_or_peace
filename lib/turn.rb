require './lib/card'
require './lib/deck'
require './lib/player'
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards.count <= 2 || @player2.deck.cards.count <=2
      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        if @player1.deck.cards.length <= 2
          :player2_winner
        else
          :player1_winner
        end
      else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      end
    else
      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
       :basic
     end
   end
 end

 def winner
   winner = []
   if type == :basic
     if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
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
   else
     "No Winner"
   end
 end

 def pile_cards
   if type == :basic
     spoils_of_war << player1.deck.cards.shift
     spoils_of_war << player2.deck.cards.shift
   elsif type == :war
     3.times do
       spoils_of_war << player1.deck.cards.shift
       spoils_of_war << player2.deck.cards.shift
     end
     spoils_of_war
   else type == :mutually_assured_destruction
     3.times do
       @spoils_of_war << player1.deck.cards.shift
       @spoils_of_war << player2.deck.cards.shift
     end
     @spoils_of_war.clear
   end
 end

 def award_spoils(winner)
   @spoils_of_war
   if winner == @player1
     @player1.deck.cards.concat(spoils_of_war)
   else
     @player2.deck.cards.concat(spoils_of_war)
   end

   # if type == :basic
   #   @player1.deck.cards.delete_at(0)
   #   @player2.deck.cards.delete_at(0)
   # elsif type == :war
   #   3.times do
   #     @player1.deck.cards.delete_at(0)
   #   3.times do
   #     @player2.deck.cards.delete_at(0)
   # elsif :mutually_assured_destruction
   #   3.times do
   #     @player1.deck.cards.delete_at(0)
   #   3.times do
   #     @player2.deck.cards.delete_at(0)
   # elsif type == :player1_winner
   #   @player2.deck.cards.clear
   # else
   #   @player2.deck.cards.clear
   # end
   #
   # @spoils_of_war.clear
 end
end
