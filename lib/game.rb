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

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Diana, The WonderWoman and Circe. Type 'GO' to start the game!------------------------------------------------------------------"
    user_input = gets.chomp.upcase
    if user_input != 'GO'
      p 'Invalid input. Please try again'
      start
    else
      play
    end
  end

#loop until turn# == 1000001 then p "---- DRAW ----"
  def play
    turn = Turn.new(@player1, @player2)
    # winner = turn.winner # little mistake, teachable moment
    # turn.pile_cards # teachable moment
    counter = 0
    while counter < 100
      # break loop if @playe1.deck.cards == 0 or if @player2..... == 0
    counter += 1
      if turn.type == :mutually_assured_destruction
        p "Turn #{counter}: *mutually_assured_destruction* 6 cards removed from play"
        turn.pile_cards
      elsif turn.type == :war
        p "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
        turn.pile_cards
        turn.award_spoils(turn.winner)
      elsif turn.type == :basic
        p "Turn #{counter}: #{turn.winner.name} won 2 cards"
        turn.pile_cards
        turn.award_spoils(turn.winner)
      end
    end
  end

  def game_end
    if @player1.has_lost?
      p "*~*~*~* #{@player2.name} has won the game!} *~*~*~*"
    elsif @player2.has_lost?
      p "*~*~*~* #{@player1.name} has won the game!} *~*~*~*"
    elsif 
      p "---- DRAW ----"
    else
    end
  end
end
