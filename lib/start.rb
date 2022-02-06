require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class Start
  attr_reader :game

  def initialize(turn)
    @game = turn
    @turn_count = 0
  end

  def start(user_input_GO)

    if user_input_GO == 'GO'

      if @game.type == :basic
        @turn_count += 1
        puts "Turn #{@turn_count}: #{@game.winner} won 2 cards"

      elsif @game.type == :mutually_assured_destruction
        @turn_count += 1
        puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"

      elsif @game.type == :war
        @turn_count += 1
        puts "Turn #{@turn_count}: WAR - #{@game.winner} won 6 cards"
      end


    else
      puts 'This command is invalid. Please rerun the game file. To start to game you have to type "GO" exactly.'
    end

  end

end
