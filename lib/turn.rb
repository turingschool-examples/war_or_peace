require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2
  attr_accessor :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      return :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_desctruction
    end

  end

  def winner
    if type == :basic

      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return player2
      end

    elsif type == :mutually_assured_desctruction
      return "No Winner"
    end

  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :mutually_assured_desctruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if type == :basic || type == :war
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
    end
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    user_input = gets.chomp
    turn_count = 0
    player1.deck.cards.shuffle!
    player2.deck.cards.shuffle!


    if user_input == 'GO'
      until @player1.has_lost? == true || @player2.has_lost? == true || turn_count == 1000000 do
        turn_count += 1
        @spoils_of_war.clear

        if type == :basic
          p "Turn#{turn_count}: #{winner.name} won 2 cards"
          pile_cards
          award_spoils(winner)
        elsif type == :war
          p "Turn#{turn_count}: WAR - #{winner.name} won 6 cards."
          pile_cards
          award_spoils(winner)
        elsif type == :mutually_assured_desctruction
          p "Turn#{turn_count}*mutually assured destruction*: 6 cards removed from play."
          pile_cards
        end
      end

    else
      p "Type GO to see a war!!"
    end

    if player1.deck.cards.count == 0
      p "WINNER: #{player2.name}"
      p "Megan: #{player1.deck.cards.count} cards"
      p "Aurora: #{player2.deck.cards.count} cards"
    elsif player2.deck.cards.count == 0
      p "WINNER: #{player1.name}"
      p "Megan: #{player1.deck.cards.count} cards"
      p "Aurora: #{player2.deck.cards.count} cards"
    end
  end
end
