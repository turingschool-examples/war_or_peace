class Game
  require 'rspec'
  require './lib/deck'
  require './lib/card'
  require './lib/player'
  require './lib/turn'
  require './lib/game'

  attr_reader :player1, :player2, :turn_counter

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    # @initial_deck = initial_deck
    @turn_counter = 0
    # require 'pry'; binding.pry

  end

  def start

    # require 'pry'; binding.pry

    if @player1.has_lost? || @player2.has_lost? || @turn_counter == 1000
      p "The game has is over!"
    else
      p "Let's keep playing!"
      takes_turn
    end

    # require 'pry'; binding.pry

  end

  def takes_turn
    # require 'pry'; binding.pry
    war_turn = Turn.new(@player1, @player2)
    war_turn_winner = war_turn.winner
    war_turn_type = war_turn.type
    require 'pry'; binding.pry
    @turn_counter +=1

    if war_turn_type == :basic
      p "Turn #{@turn_counter}: #{war_turn_winner.name} won 2 cards"
    elsif war_turn_type == :war
      p "Turn #{@turn_counter}: WAR - #{war_turn_winner.name} won 6 cards"
    else
      p "Turn #{@turn_counter}*mutually assured destruction* 6 cards removed from play"
    end

    war_turn.pile_cards
    war_turn.award_spoils(war_turn_winner)

    require 'pry'; binding.pry



  end


end
