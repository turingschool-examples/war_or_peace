require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/turn'

class Game
  def initialize
    @fulldeck = create_deck
    @deck1 = Deck.new(@fulldeck[0..25])
    @deck2 = Deck.new(@fulldeck[26..51])
    @player1 = Player.new("Diana, The WonderWoman", @deck1)
    @player2 = Player.new("Circe", @deck2)
  end

  def create_deck
    fulldeck = []
    suits = ["spades", "diamonds", "hearts", "clubs"]
    ranks = {"A" => 14 ,
              "2" => 2,
              "3" => 3,
              "4" => 4,
              "5" => 5,
              "6" => 6,
              "7" => 7,
              "8" => 8,
              "9" => 9,
              "10" => 10,
              "J" => 11,
              "Q" => 12,
              "K" => 13
              }

    suits.each do |suit|
      ranks.each do |value,rank|
        card = Card.new(suit, value, rank)
        fulldeck << card
      end
    end
    fulldeck.shuffle!
  end

  def power_on
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!------------------------------------------------------------------"
    user_input = gets.chomp
    if user_input != 'GO'
      p 'Invalid input. Please try again'
      power_on
    else
      start_game
    end
  end

  def turn_counter
  end



  def start_game
    #loop until turn# == 1000001 then p "---- DRAW ----"
    if type == :mutually_assured_destruction
      p "Turn #{}: *mutually_assured_destruction* #{} cards removed from play"
    elsif type == :war
      p "Turn #{}: WAR - #{turn.winner.name} won #{} cards"
    elsif type == :basic
      p "Turn #{}: #{turn.winner.name} won #{} cards"
    end
  end

  def game_end
    if @player1.has_lost?
      p "*~*~*~* #{@player2.name} has won the game!} *~*~*~*"
      power_off
    elsif @player2.has_lost?
      p "*~*~*~* #{@player1.name} has won the game!} *~*~*~*"
      power_off
    elsif turn_counter == 1000001
      p "---- DRAW ----"
      power_off
  end
end

  def power_off
    #how to make it wait a few sec before exiting like 15 sec countdown??exit!
  end
end


  # turn = Turn.new(@player1, @player2)
  # turn.type
