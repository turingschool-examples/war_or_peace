require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

# create cards
suits = [:heart, :club, :diamond, :spade ]
rank_vals = {"2" => 2, "3" => 3, "4" => 4, "5" => 5,
   "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 11,
   "Queen" => 12, "King" => 13, "Ace" => 14}

cards = []
suits.each do |suit|
  rank_vals.each do |rank, value|
      cards << Card.new(suit, value, rank)
    end
end

cards.shuffle!
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new("Megan", deck2)
player2 = Player.new("Aurora", deck1)
turn = Turn.new(player1, player2)

class Game

  def initialize(turn)
    @turn = turn
  end

  def start
      puts "Welcome to War! (or Peace) This game will be played with 52 cards."
      puts "The players today are #{@turn.player1.name} and #{@turn.player2.name}."
      puts "Type 'GO' to start the game!"
      puts "------------------------------------------------------------------"

      prompt = gets.chomp

      while prompt != "GO"
        puts "Type 'GO' to start the game!"
        puts "------------------------------------------------------------------"
        prompt = gets.chomp
      end

      count = 1
      #binding.pry
      while (!@turn.player1.has_lost?) && (!@turn.player2.has_lost?) && (count <= 1000000)
          #binding.pry
          if @turn.type == :basic
            puts "Turn #{count}: #{@turn.winner.name} won 2 cards"
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
          elsif @turn.type == :war
            puts "Turn #{count}: WAR - #{@turn.winner.name} won 6 cards"
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)
          elsif @turn.type == :mutually_assured_destruction
            puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
            @turn.pile_cards
          end

          count += 1

      end

      if @turn.player1.has_lost?
        puts "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
      elsif @turn.player2.has_lost?
        puts "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
      end

  end
end

game = Game.new(turn)
game.start
