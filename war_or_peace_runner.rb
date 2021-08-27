require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

suits = [:heart, :club, :diamond, :spade ]
values = ["1", "2", "3", "4", "5," "6", "7", "8", "9", "10",
        "Jack", "Queen", "King", "Ace"]
ranks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

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
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
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
      msg = {basic: "", war: "WAR - "}

      while !@turn.player1.has_lost? || !@turn.player2.has_lost? || count < 100000000
        type = @turn.type
        if @turn.winner.class == Player
          winner = @turn.winner
        end
        @turn.pile_cards

        if type == :basic || type == :war
          puts "Turn #{count}:#{msg[type]}#{winner.name} won #{@turn.spoils_of_war.length} cards"
        else
          puts "*mutually assured destruction* 6 cards removed from play"
        end

        @turn.award_spoils(winner)
        count += 1
      end

      #puts "...\n...\n...\n"

      if player1.has_lost?
        puts "*~*~*~* #{player2} has won the game! *~*~*~*"
      elsif player2.has_lost?
        puts "*~*~*~* #{player1} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
      end

  end
end

game = Game.new(turn)
game.start
