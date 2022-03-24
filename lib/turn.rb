require './lib/card'
require './lib/deck'
require './lib/player'
require './pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  #Initialize takes in two player objects
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #Determine the type of play based on the first cards from each player's deck
  #if the first cards are the same rank check the third card in each deck
  def type
    p1_rank = @player1.deck.rank_of_card_at(0)
    p2_rank = @player2.deck.rank_of_card_at(0)
    #binding.pry
    type = :basic
    if (p1_rank == p2_rank)
      type = :war
      p1_rank_2 = @player1.deck.rank_of_card_at(2)
      p2_rank_2 = @player2.deck.rank_of_card_at(2)
      if (p1_rank_2 == p2_rank_2)
        type = :mutually_assured_destruction
      end
    end
    return type
  end

  #determines that player that won the turn and
  #returns the player that won or "No winner"
  def winner
    t = type
    result = ""
    if(t == :basic)
      p1_rank = @player1.deck.rank_of_card_at(0)
      p2_rank = @player2.deck.rank_of_card_at(0)
      if(p1_rank > p2_rank)
        result = @player1
      else
        result = @player2
      end
    elsif(t == :war)
      p1_rank_2 = @player1.deck.rank_of_card_at(2)
      p2_rank_2 = @player2.deck.rank_of_card_at(2)
      if(p1_rank_2 > p1_rank_2)
        result = @player1
      else
        result = @player2
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
    t = type
    if(t == :basic)
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif(t == :war)
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
