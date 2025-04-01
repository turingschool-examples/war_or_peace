require 'pry'
class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) #when the rank_of_card_at(0) from the players’ decks are NOT the same rank.
      :basic #I had to remember that you can't call rank_of method unless you call .deck on player, that's how you get acess to it
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) #when both players’ rank_of_card_at(0) are the same.
      :war 
      # binding.pry
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction  #when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    end
  end

  def winner
    if type == :basic #whichever player has a higher rank_of_card_at(0)
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)  
        return @player1
      else 
        return @player2
      end 
    elsif type == :war #whichever player has a higher rank_of_card_at(2)
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else 
        return @player2
      end   
    else type == :mutually_assured_destruction
      return "No Winner"
    end
    #learned I can put an if/else statement within another if/elsif/else statement 
  end

  def pile_cards #cards will be sent from the players’ decks into the @spoils_of_war based on these rules
    if type == :basic #each player will send one card (the top card) to the spoils pile
      @spoils_of_war.push(@player1.deck.cards.first)
      @spoils_of_war.push(@player2.deck.cards.first)
      #@spoils_of_war << @player2.deck.cards.first - tried this first and was passing but also producing duplicates
      #origionaly used .concat but it was throwing an error no implicit conversion of Card into Array (TypeError), unless I used [] within ()
      #replaced with .push since I think concat is for multiple elements in an array
    elsif type == :war #each player will send three cards (the top three cards) to the spoils pile
      @spoils_of_war.concat(@player1.deck.cards.first(3))
      @spoils_of_war.concat(@player2.deck.cards.first(3))
      #@spoils_of_war << @player2.deck.cards.first(3) - wrote this first but was creating nested array
    else type == :mutually_assured_destruction 
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
      #Each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
      #check for duplicates 
    end

    #this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war) #this method will add each of the cards in the @spoils_of_war array to the winner
  end   #could I have done this differently with #pile_cards?
end
