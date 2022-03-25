class Game
  require 'rspec'
  require './lib/deck'
  require './lib/card'
  require './lib/player'
  require './lib/turn'
  require './lib/game'

  attr_reader :player1, :player2, :turn_counter, :game_over

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    # @initial_deck = initial_deck
    @turn_counter = 0
    # require 'pry'; binding.pry
    @game_over = false

  end

  def takes_turn
    # require 'pry'; binding.pry
    war_turn = Turn.new(@player1, @player2)
    war_turn_winner = war_turn.winner
    war_turn_type = war_turn.type
    # require 'pry'; binding.pry
    @turn_counter +=1
    turn_message = ""

    if war_turn_type == :basic
      turn_message = "Turn #{@turn_counter}: #{war_turn_winner.name} won 2 cards"
    elsif war_turn_type == :war
      turn_message = "Turn #{@turn_counter}: WAR - #{war_turn_winner.name} won 6 cards"
    else
      turn_message = "Turn #{@turn_counter} *mutually assured destruction* 6 cards removed from play"
    end

    war_turn.pile_cards
    war_turn.award_spoils(war_turn_winner)

    # if @turn_counter % 500 == 0
    #   require 'pry'; binding.pry
    #   @player1 = Player.new(@player1.name, @player1.deck.cards.shuffle)
    #   @player2 = Player.new(@player2.name, @player2.deck.cards.shuffle)
    #   require 'pry'; binding.pry
    # end

    return turn_message
    # require 'pry'; binding.pry
  end

  def start
    # require 'pry'; binding.pry
    #
    # if @player1.has_lost? || @player2.has_lost? || @turn_counter == 10000
    #
    #   if@player1.has_lost?
    #     p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    #     @game_over = true
    #   else
    #     p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    #     @game_over = true
    #   end



    if @turn_counter == 100000
      @game_over = true
      # require 'pry'; binding.pry
      "---- DRAW ----"


    elsif @player1.has_lost?
      @game_over = true
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"

    elsif @player2.has_lost?
      @game_over = true
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"

    else
      # p "Let's keep playing!"
      # require 'pry'; binding.pry
       takes_turn
      # require 'pry'; binding.pry
    end

    # require 'pry'; binding.pry

  end




end
