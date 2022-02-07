require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Game
  attr_reader :player1, :player2, :cards, :turn_count, :winner

  def initialize
    cards = make_cards
    deck_1 = Deck.new(cards.pop(26))
    deck_2 = Deck.new(cards)
    @player1 = Player.new("Megan", deck_1)
    @player2 = Player.new("Aurora", deck_2)
    @turn_count = 0
    @winner = nil
  end

  def make_cards
    suits = [:spade, :club, :heart, :diamond]
    cards_array = []
    suits.each do |suit|
      values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
      value_rank_pairs = values.zip((1..14).to_a)
      value_rank_pairs.each do |pairs|
        card = Card.new(suit, pairs[0], pairs[1])
        cards_array << card
      end
    end
    cards_array.shuffle
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards. \n
    The players today are #{player1.name} and #{player2.name}. \n
    Type 'GO' to start the game!"
    input = gets.chomp.downcase
    if input == 'go'
      while player_win? == false
        take_turn
      end
    elsif
      p "unrecognized input '#{input}'/n  Please enter 'GO' to play"
      start
    end
    p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
  end

  def player_win?
    @player1.has_lost? || @player2.has_lost?
  end

  def take_turn
    @turn_count += 1
    if @turn_count <= 1000000
      turn = Turn.new(player1, player2)

      case turn.type
      when :basic
        p "Turn #{turn_count.to_s}: #{turn.winner.name} won 2 cards"
      when :war
        p "Turn #{turn_count.to_s}: WAR! #{turn.winner.name} won 6 cards"
      when :mutually_assured_destruction
        p "Turn #{turn_count.to_s}: *Mutually Assured Destruction* 6 cards removed from play"
      end
      turn.pile_cards
      @winner = turn.winner
      turn.award_spoils(@winner) 
    else
      p "Just as in real life, War has no winners."
      p "----------THE GAME IS A DRAW ------------"
    end
  end
end

Game.new.start
