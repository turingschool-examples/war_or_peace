require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :turn_type,
              :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = turn_type
    @winner = winner
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      turn_type = :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      turn_type = :mutually_assured_destruction
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      turn_type = :war
    end
    # turn_type
  end

  def winner
    if type == :mutually_assured_destruction
      return "No Winner"
    end

    if type == :basic
      player1.deck.cards[0].rank > player2.deck.cards[0].rank
      return player1
    else
      return player2
    end

    if type == :war
      #maybe try player1.rank_of_card_at
      player1.deck.cards[2].rank > player2.deck.cards[2].rank
      return player1
    else
      return player2
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
    (winner.deck.cards << @spoils_of_war).flatten
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{player1.name} and #{player2.name}.
Type 'GO' to start the game!
---------------------------------------------------------------------"

    input = gets.chomp
    count = 0
    if input == "GO"
      until player1.has_lost? == true || player2.has_lost? == true do
        count += 1
        pile_cards
        winner
        award_spoils(winner)
        if type == :basic
          puts "Turn #{count}: #{winner.name} won 2 cards"
        elsif type == :war
          puts "Turn #{count}: WAR - #{winner.name} won 6 cards"
        elsif type == :mutually_assured_destruction
          puts "Turn #{count}: *mutually_assured_destruction* 6 cards removed from play"
        end
      end
    else puts "You entered something other than 'GO'"
    end
  end
end
