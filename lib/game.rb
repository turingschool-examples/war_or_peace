require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


class Game
    attr_reader :all_cards, :deck1, :deck2, :player1, :player2, :turn_count
    attr_writer :deck1, :deck2, :player1, :player2, :turn_count
  def initialize
    @suits = [:heart, :diamond, :spade, :club]
    @values = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'] #You forgot jack, queen, king, and ace
    @all_cards = []
    @deck1
    @deck2
    @player1
    @player2
    @turn_count = 0
  end

  def populate_deck
    if @all_cards == []
      @suits.each do |current_suit|
        suit = current_suit
        @values.each do |current_value| #if value is jqk rank can be set manually?
          value = current_value
          if value == 'Jack'
            rank = 11
          elsif value == 'Queen'
            rank = 12
          elsif value == 'King'
            rank = 13
          elsif value == 'Ace'
            rank = 14
          else
            rank = value.to_i
          end
          suit_value = Card.new(suit, value, rank)
          @all_cards << suit_value
        end
      end
    else
      puts 'Cards left over, unsure how to respond'
    end
  end

  def deal
    deck1 = []
    deck2 = []
    @all_cards.shuffle!
    deck1 << @all_cards.shift(26)
    deck2 << @all_cards.shift(26)
    deck1.flatten
    deck2.flatten
    @deck1 = Deck.new(deck1.flatten)
    @deck2 = Deck.new(deck2.flatten)
  end

  def create_players
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def next_turn?
    !@player1.has_lost? && !@player2.has_lost?
  end

  def match
    # @turn_count = 0
    while next_turn? && turn_count <= 1000000
      @turn_count += 1
      turn = Turn.new(@player1, @player2)
      turn.type
      turn.pile_cards
      if turn.type == :basic
        puts "Turn #{@turn_count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        turn.award_spoils(turn.winner)
      elsif turn.type == :war
        puts "Turn #{@turn_count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        turn.award_spoils(turn.winner)
      else
        puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
      end
    end
    if @player1.has_lost?
      puts "#{@player2.name} has won the game!"
    elsif @player2.has_lost?
      puts "#{@player1.name} has won the game!"
    else
      puts "----DRAW----"
    end
  end


  def start
    populate_deck
    deal
    create_players
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{@player1} and #{@player2}"
    puts "Type 'GO' to start the game!"
    response = gets.chomp!
    if response == 'GO'
      match
    else
      "That's not a vaid response, please reload game"
    end
  end
end
