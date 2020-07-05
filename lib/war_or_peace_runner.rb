require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'

class Game
  attr_reader :deck, :suits, :value, :rank, :player1, :player2, :start, :turn_counter

  def initialize(player1, player2)
    filename = './data/cards.txt'
    # @deck = []
    @deck = CardGenerator.new(filename).cards
    @suits = [:heart, :spade, :diamond, :club]
    @values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    @ranks = {2 => '2', 3=> '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => '10', 11 => 'Jack', 12 => 'Queen', 13 => 'King', 14 => 'Ace'}
    @player1 = player1
    @player2 = player2
    # generate_deck commented out for new method
    split_deck
    @start = false
    @turn_counter = 0
  end

# commented out for new deck method
  # def generate_deck
  #   @suits.each do |suit|
  #     @values.each do |value|
  #       rank = @ranks.key(value)
  #       @deck << Card.new(suit, value, rank)
  #     end
  #   end
  #   @deck = Deck.new(@deck)
  # end

  def split_deck
    @deck.cards.shuffle!
    @deck1 = Deck.new(deck.cards.slice!(0, 26))
    @player1 = Player.new(@player1, @deck1)

    @deck2 = Deck.new(deck.cards.slice!(0, 26))
    @player2 = Player.new(@player2, @deck2)
  end

  def start
    puts "Welcome to War! (or Peace). This game will be played with 52 cards."
    puts "The players for today are #{player1.name} and #{player2.name}"
    puts "Type 'GO' to start the game!"
    puts "------------------------------"

    print "> "
    start = gets.chomp

    if start == "GO"
      @start = true
    end

    if @start == true

    until player1.has_lost? || player2.has_lost? || turn_counter == 53
      turn = Turn.new(player1, player2)
      @turn_counter += 1
      type = turn.type
      winner = turn.winner(type)

      if type == :basic
        turn.pile_cards
        p "Turn #{turn_counter}: #{winner.name} won #{turn.spoils_of_war.length} cards!"
        turn.awards_spoils(winner)
      elsif type == :war
        turn.pile_cards
        p "Turn #{turn_counter}: WAR - #{winner.name} won #{turn.spoils_of_war.length} cards!"
        turn.awards_spoils(winner)
      elsif type == :mutually_assured_destruction
        turn.pile_cards
        p "Turn #{turn_counter}: *Mutually Assured Destruction* #{turn.spoils_of_war.length} cards removed from play!"
      end
      if @turn_counter == 53
        p "----DRAW----"
      end
    end
    puts "*~*~*~*~*~ #{winner.name} has won the game!!!! *~*~*~*~*~"
    end
  end
end

game = Game.new("Megan", "Aurora")
game.start
