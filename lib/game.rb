require './lib/deck_generator'
require './lib/turn'
require './lib/player'
require 'pry'

class Game
  attr_accessor :turn,
                :turn_type,
                :hand_winner,
                :deck1,
                :deck2,
                :player1,
                :player2,
                :counter

  def initialize(deck_of_cards:)
    @turn = nil
    @deck1 = Deck.new(deck_of_cards.slice!(0, 26))
    @deck2 = Deck.new(deck_of_cards.slice!(0, 26))
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @counter = 1
  end

  def start
    make_turn
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nPress 'RETURN' to start the game\n------------------------------------------------------------------"
    game_loop
  end

  def game_over?
    @player1.has_lost? || @player2.has_lost?
  end

  def two_card_endgame?
    @player1.deck.cards.length == 2 || @player2.deck.cards.length == 2
  end

  def two_card_endgame(counter)
    case turn.type
    when :basic
      normal_game_play(counter)
    when :war
      if @player2.deck.cards[2].nil?
        @player1.deck.cards.concat(@player2.deck.cards.pop(2))
      elsif @player1.deck.cards[2].nil?
        @player2.deck.cards.concat(@player1.deck.cards.pop(2))
      end
    else
      'not allowed'
    end
  end

  def one_card_endgame?
    @player1.deck.cards.length == 1 || @player2.deck.cards.length == 1
  end

  def one_card_endgame
    if player2_wins_basic?
      send_card_to_player2
    else
      send_card_to_player1
    end
  end

  def normal_game_play(counter)
    winner = turn.winner
    case @turn.type
    when :mutually_assured_destruction
      turn.pile_cards
      puts "turn #{counter}: No winner: mutually assured destruction 6 cards removed"
      puts "#{@player1.name}: #{@player1.deck.cards.count}| #{@player2.name}: #{@player2.deck.cards.count}"
    when :war
      turn.pile_cards
      puts "turn #{counter}: WAR -  #{winner.name} won #{turn.spoils_of_war.count} cards"
      winner.deck.cards.shuffle!
      turn.award_spoils(winner)
      puts "#{@player1.name}: #{@player1.deck.cards.count}| #{@player2.name}: #{@player2.deck.cards.count}"
    when :basic
      turn.pile_cards
      puts "turn #{counter}: #{winner.name} won #{turn.spoils_of_war.count} cards"
      winner.deck.cards.shuffle!
      turn.award_spoils(winner)
      puts "#{@player1.name}: #{@player1.deck.cards.count}| #{@player2.name}: #{@player2.deck.cards.count}"
    else
      'uh oh'
    end
  end

  def make_turn
    @turn = Turn.new(@player1, @player2)
  end

  def game_over
    if @player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
      puts '---- DRAW ----'
    end
  end

  def game_loop
    until counter == 1000000
      if game_over? # game over
        break
      elsif two_card_endgame?
        two_card_endgame(@counter)
      elsif one_card_endgame?
        one_card_endgame
      else
        normal_game_play(@counter)
      end

      @turn = Turn.new(@player1, @player2)

      @counter += 1
    end
    game_over
  end

  def player2_wins_basic?
    @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
  end

  def send_card_to_player2
    @player2.deck.cards << @player1.deck.cards.pop
  end

  def send_card_to_player1
    @player1.deck.cards << @player2.deck.cards.pop
  end
end
