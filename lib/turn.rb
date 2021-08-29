require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
            player1.rank_of_card_at(2) == player2.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :mutually_assured_destruction
    end
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      elsif player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        return player2
      end
    end
    # check_deck
    if type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        return player2
      end
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.cards.shift
      player2.deck.cards.shift
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player2.deck.cards[0]
        player1.deck.cards.shift
        player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.cards.shift
        player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    pile_cards
    if winner == player1
      while @spoils_of_war != [] do
        player1.deck.cards << @spoils_of_war.shift
      end
    elsif winner == player2
      while @spoils_of_war != [] do
        player2.deck.cards << @spoils_of_war.shift
      end
    end
  end

  def loop
    count = 0
    until player1.has_lost? == true || player2.has_lost? == true do

      puts player1.deck.cards.count
      puts player2.deck.cards.count
      if winner == nil
        puts "MAD"
      else
        winner_name = winner.name
      end

      if type == :basic
        puts "Turn #{count}: turn type is #{type}, #{winner_name} won 2 cards"
      elsif type == :war
        puts "Turn #{count}: WAR - #{winner_name} won 6 cards"
      elsif type == :mutually_assured_destruction
        puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
      end
      award_spoils(winner)

      if count >= 1000000
        puts "Draw"
        break
      elsif player1.has_lost? == true
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif player2.has_lost? == true
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      end
      count += 1
    end
  end
  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{player1.name} and #{player2.name}.
Type 'GO' to start the game!
---------------------------------------------------------------------"

    input = gets.chomp

    if input == "GO"
    loop
    else puts "You entered something other than 'GO'"
    end
  end
end
