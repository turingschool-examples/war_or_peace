require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

#
# @suits = [:heart, :diamond, :spade, :club]
# @values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13']
# @rank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
# @cards = []
# @deck1 = []
# # @deck2 = []
# @player1 = 'Megan'
# @player2 = 'Aurora'

class Game
    attr_reader :all_cards, :deck1, :deck2, :player1, :player2, :turn_count
    attr_writer :deck1, :deck2, :player1, :player2, :turn_count
  def initialize
    @suits = [:heart, :diamond, :spade, :club]
    @values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13']
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
        @values.each do |current_value|
          value = current_value
          rank = value.to_i
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


war = Game.new
war.start
# populate_deck
#
# puts @cards.count
# puts @deck1
# puts @deck2
# puts @cards.count
# card1 = Card.new(suit[0], value[0], rank[0])
# card2 = Card.new(suit[0], value[1], rank[1])
# card3 = Card.new(suit[0], value[2], rank[2])
# card4 = Card.new(suit[0], value[3], rank[3])
# card5 = Card.new(suit[0], value[4], rank[4])
# card6 = Card.new(suit[0], value[5], rank[5])
# card7 = Card.new(suit[0], value[6], rank[6])
# card8 = Card.new(suit[0], value[7], rank[7])
# card9 = Card.new(suit[0], value[8], rank[8])
# card10 = Card.new(suit[0], value[9], rank[9])
# card11 = Card.new(suit[0], value[10], rank[10])
# card12 = Card.new(suit[0], value[11], rank[11])
# card13 = Card.new(suit[0], value[12], rank[12])
# card14
# card15
# card16
# card17
# card18
