require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class Start
  attr_reader :game

  def initialize(turn)
    @game = turn

  end

  def start(user_input_GO)
    turn_count = 0

    if user_input_GO == 'GO'

      until @game.type == :draw || turn_count == 1000000

        turn_count += 1

        if @game.type == :basic

          puts "Turn #{turn_count}: #{@game.winner.name} won 2 cards"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        elsif @game.type == :mutually_assured_destruction

          puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        elsif @game.type == :war

          puts "Turn #{turn_count}: WAR - #{@game.winner.name} won 6 cards"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        end

      end

    puts "*~*~*~* #{@game.winner_of_game} has won the game! *~*~*~*"

    else
      puts 'This command is invalid. Please rerun the game file. To start to game you have to type "GO" exactly.'
    end

  end

end
