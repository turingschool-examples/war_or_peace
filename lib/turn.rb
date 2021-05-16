require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  # Determines the type of turn that will take place
  # symbol :basic, :war, :mutually_assured_destruction
  def type
     if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
       :basic
     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
       :mutually_assured_destruction
     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
       :war
     end
   end

   # game mechanic that determines the winner
   def winner
     if type == :basic
       if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
         @player1
       elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
         @player2
       end
     elsif type == :war
       if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
         @player1
       elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
         @player2
       end
     elsif type == :mutually_assured_destruction
       puts "No Winner"
     end
   end

   # when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
   def pile_cards
     if type == :basic
       self.spoils_of_war << @player1.deck.remove_card
       self.spoils_of_war << @player2.deck.remove_card
     elsif type == :war
      3.times do
        self.spoils_of_war <<  @player1.deck.remove_card
        self.spoils_of_war <<  @player2.deck.remove_card
      end
     elsif type == :mutually_assured_destruction
       3.times do
         @player1.deck.remove_card
         @player2.deck.remove_card
       end
     end
   end

   # This method will add each of the cards in the @spoils_of_war array to the winner of the turn
   # .map
   def award_spoils(winner)
     @spoils_of_war.each do |card|
       winner.deck.cards << card
     end
     @spoils_of_war = []
   end
end
