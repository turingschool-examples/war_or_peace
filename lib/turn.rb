require './lib/card'
require './lib/deck'
require './lib/player'
require './pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war, :type

  #Initialize takes in two player objects
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
    #Determine if the turn is war, or mutually assured destruction instead of basic
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))
      @type = :war
      #If there are enough cards in both decks check the third card for equivalence
      if((@player1.deck.cards.length > 2) && (@player2.deck.cards.length > 2))
        if (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
            @type = :mutually_assured_destruction
        end
      end
    end
  end

  #returns the player that won or "No winner"
  def winner
    result = ""
    if(@type == :basic)
      if(@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
        result = @player1
      else
        result = @player2
      end
    elsif(@type == :war)
      #If a player has less than 3 cars left, make the other palyer the Winner
      # and put the type to basic so only one card will be removed from each player
      if(@player1.deck.cards.length < 3)
        result = @player2
        @type = :basic
      elsif(@player2.deck.cards.length < 3)
        result = @player1
        @type = :basic
      #If both players have more than 3 cards left this else branch will execute
      else
        #Check which players 3rd card is highest and make them the winner
        if(@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2))
          result = @player1
        else
          result = @player2
        end
      end
    #If it is not :basic or :war it is :mutually_assured_destruction and there is no winner
    else
      result = "No Winner"
    end
    return result
  end

  #if type is :basic or :war remove cards from each player
  #and add them to spoils_of_war
  #otherwise remove three cards from each players deck from play
  def pile_cards
    if(@type == :basic)
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif(@type == :war)
      3.times do
        @spoils_of_war << @player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player2.deck.remove_card
      end
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  #add all the cards in spoils_of_war to the winner
  #winner is a player object
  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end

end
