require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class Start
  attr_reader :game, :turn_count

  def initialize(turn)
    @game = turn
    @turn_count = 0
  end

  def start(user_input_GO)

    if user_input_GO == 'GO'

      until @game.player1.deck.cards.length < 1 || @game.player2.deck.cards.length < 1

        if @game.type == :basic
          @turn_count += 1
          puts "Turn #{@turn_count}: #{@game.winner.name} won 2 cards"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        elsif @game.type == :mutually_assured_destruction
          @turn_count += 1
          puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        elsif @game.type == :war
          @turn_count += 1
          puts "Turn #{@turn_count}: WAR - #{@game.winner.name} won 6 cards"
          @game.pile_cards
          @game.award_spoils(@game.winner)

        end

      end


    else
      puts 'This command is invalid. Please rerun the game file. To start to game you have to type "GO" exactly.'
    end

  end

end
