require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
      @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(2) == nil ||
      player2.deck.rank_of_card_at(2) == nil
      return :war
    else
      return :war
    end
  end

  def winner
    if @player1.deck.rank_of_card_at(2) == nil
      winner = @player2
    elsif @player2.deck.rank_of_card_at(2) == nil
      winner = @player1
    elsif type == :basic && @player1.deck.rank_of_card_at(0) >
      @player2.deck.rank_of_card_at(0)
      @player1
    elsif type == :basic && @player1.deck.rank_of_card_at(0) <
      @player2.deck.rank_of_card_at(0)
      @player2
    elsif type == :war && @player1.deck.rank_of_card_at(2) >
      @player2.deck.rank_of_card_at(2)
      @player1
    elsif type == :war && @player1.deck.rank_of_card_at(2) <
      @player2.deck.rank_of_card_at(2)
      @player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
    elsif type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    end
    @spoils_of_war.flatten!
  end

  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      winner.deck.cards.append(@spoils_of_war)
      winner.deck.cards.flatten!
    end
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p '---------------------------------------------------------------------'

    input = gets.chomp.upcase
    if input == 'GO'
      p "The game has started!"
      count = 0
      until @player1.has_lost? || @player2.has_lost? || count == 1000000 do
        count += 1
        pile_cards
        award_spoils(winner)
        if type == :basic
          p "Turn #{count}: #{winner.name} won 2 cards"
        elsif type == :war
          p "Turn #{count}: WAR - #{winner.name} won 6 cards"
        else
          p "Turn #{count}: *mutually_assured_destruction* 6 cards removed from play."
        end
        @spoils_of_war.clear
      end
      award_spoils(winner)
      if @player2.has_lost? && @player1.has_lost? ||
        count == 1000000 && !@player1.has_lost? && !@player2.has_lost?
        p "-----DRAW-----"
      elsif @player1.has_lost?
        p "*~*~*~* #{@player2.name} has won! *~*~*~*"
      else
        p "*~*~*~* #{@player1.name} has won! *~*~*~*"
      end
    end
  end
end
