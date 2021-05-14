require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'

class Game
  attr_reader :cards, :type_error

  def initialize()
    @cards = Array.new
    @suits = [:heart, :spade, :diamond, :club]
    @values_and_ranks = {
      'Ace': 14,
      'King': 13,
      'Queen': 12,
      'Jack': 11,
      :numeric => (2..10)
    }

    @suits.each do |suit|
      @values_and_ranks.each do |value, rank|
        if value != :numeric
          @cards << Card.new(suit, value, rank)
        elsif value == :numeric
          rank.each do |rank|
            @cards << Card.new(suit, rank.to_s, rank)
          end
        end

      end
    end

    @cards = @cards.sample(52)
    @type_error = [
      'Error!',
      'Two valid players are required to start the game, please try again.'
    ]
  end

  def print_type_error()
    self.type_error.each do |line|
      puts line
    end
  end

  def greet(player1, player2)
    puts "\n"

    if player1.class == Player && player2.class == Player
      welcome = [
        "Welcome to War! (or Peace) This game will be played with #{self.cards.length} cards.",
        "The players today are #{player1.name} and #{player2.name}.",
        "Type 'GO' to start the game!",
        "-"*50
      ]
      welcome.each do |line|
        puts line
      end

    else
      print_type_error()
    end

  end


  def start(player1, player2)
    if player1.class == Player && player2.class == Player
      total_turn_counter = 1
      basic_turn_counter = 0
      war_turn_counter = 0
      mas_turn_counter = 0

      until player1.has_lost? || player2.has_lost? || total_turn_counter == 1000001
        turn = Turn.new(player1, player2)
        type = turn.type
        winner = turn.winner
        turn.pile_cards
        spoils = turn.spoils_of_war
        cards_won = spoils.length
        turn.award_spoils(winner)
        if type == :mutually_assured_destruction
          puts "Turn #{total_turn_counter}: *mutually assured destruction* 6 cards removed from play"
          mas_turn_counter += 1
        elsif type == :war
          puts "Turn #{total_turn_counter}: WAR - #{winner.name} won #{cards_won} cards"
          war_turn_counter += 1
        elsif type == :basic
          puts "Turn #{total_turn_counter}: #{winner.name} won #{cards_won} cards"
          basic_turn_counter += 1
        end

        total_turn_counter += 1
        cards_won = 0
      end

      if player1.has_lost?
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif player2.has_lost?
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
      end

      results = [
        "\n",
        "Final results:",
        "-"*16,
        "#{basic_turn_counter} total 'basic' turns.",
        "#{war_turn_counter} total 'war' turns.",
        "#{mas_turn_counter} total 'mutually assured destruction' turns."
      ]
      results.each do |result|
        puts result
      end

    else
      print_type_error()
    end
  end


end
