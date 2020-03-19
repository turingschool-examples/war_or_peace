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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return :war
    else
      return :mutually_assured_destruction
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    c = 0
    if self.type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif self.type == :war
      while c <= 2
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        c += 1
      end
    else
      while c <= 2
        @player1.deck.remove_card
        @player2.deck.remove_card
        c += 1
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.add_card(spoil)
    end
    @spoils_of_war.clear
  end

  def start
    turncount = 1
    until (@player1.has_lost? || @player2.has_lost?) || turncount == 1000000
      type = self.type
      winner = self.winner
      self.pile_cards
      if type == :basic
        puts "#{winner.name} won #{@spoils_of_war.length} cards"
        award_spoils(winner)
      elsif type == :war
        puts "WAR - #{winner.name} won #{@spoils_of_war.length} cards"
        award_spoils(winner)
      else
        puts "*Mutually Assured Destruction* - 6 cards removed from play"
      end
    end
    if @player1.has_lost?
      return @player2.name
    elsif @player2.has_lost?
      return @player1.name
    else
      return "DRAW"
    end
  end

end
