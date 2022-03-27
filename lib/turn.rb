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
    p1_rank = @player1.deck.rank_of_card_at(0)
    p2_rank = @player2.deck.rank_of_card_at(0)
    if (p1_rank == p2_rank)
      @type = :war
      #if player 1 or 2 does not have 2 cards left don't check for them
      #will handle this case differently in winner
      if((@player1.deck.cards.length < 3) || (@player2.deck.cards.length < 3))
        #don't check for mutual destruction, not possible in this case
      else
        p1_rank_2 = @player1.deck.rank_of_card_at(2)
        p2_rank_2 = @player2.deck.rank_of_card_at(2)
        if (p1_rank_2 == p2_rank_2)
          @type = :mutually_assured_destruction
        end
      end
    end
  end

  #determines the player that won the turn and
  #returns the player that won or "No winner"
  def winner
    result = ""
    if(@type == :basic)
      p1_rank = @player1.deck.rank_of_card_at(0)
      p2_rank = @player2.deck.rank_of_card_at(0)
      if(p1_rank > p2_rank)
        result = @player1
      else
        result = @player2
      end
    elsif(@type == :war)
      #in the first two conditionals, when there is a player that does not have
      # enough cards to compare the 3, make the other palyer the Winner
      # and put the type to basic so only one card will be removed from each player
      if(@player1.deck.cards.length < 3)
        #puts("player 1 doesnt have enough cards")
        result = @player2
        @type = :basic
      elsif(@player2.deck.cards.length < 3)
        #puts("player 2 doesn't have enough cards")
        result = @player1
        @type = :basic
      else
        p1_rank_2 = @player1.deck.rank_of_card_at(2)
        p2_rank_2 = @player2.deck.rank_of_card_at(2)
        if(p1_rank_2 > p2_rank_2)
          result = @player1
        else
          result = @player2
        end
      end
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
