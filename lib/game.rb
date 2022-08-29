require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :name1, :name2, :cards,
              :player1, :player2, :turn_count
  def initialize
    @turn_count = 0
    self.get_names
    self.get_cards
    self.create_players
  end

  def get_names
    @name1 = "Will"
    # puts "Enter player name: "
    # @name2 = gets.chomp
    @name2 = "GODZILLA"
  end

  def get_cards
    @cards = CardGenerator.new("cards.txt").cards
    # @cards = CardGenerator.new("test_cards2.txt").cards
  end

  def start
    self.display_start_message
    user_input = gets.chomp
    if user_input.downcase == "go"
      self.run_game
    else
      self.abort("Exiting program...")
    end
  end

  def run_game
    1_000_000.times do
      self.new_turn
      self.check_for_winner
    end
  end

  def create_players
    @cards.shuffle!
    card_half1 = []
    card_half2 = []
    until @cards.length == 0
      #if for some reason there are an odd number of cards
      if @cards.length == 1
        card_half1 << @cards.pop
      else
        #this should usually happen for a 52-card deck
        card_half1 << @cards.pop
        card_half2 << @cards.pop
      end
    end
    deck1 = Deck.new(card_half1)
    deck2 = Deck.new(card_half2)
    @player1 = Player.new(@name1, deck1)
    @player2 = Player.new(@name2, deck2)
  end

  def display_start_message
    puts "Welcome to War! (or Peace) This game will be played with #{@cards.length} cards"
    puts "The players today are #{@name1} and #{@name2}."
    puts "Type 'GO' to start the game!"
    puts "-----------------------------------------------------------------"
  end

  def new_turn
    @turn_count += 1
    turn = Turn.new(@player1, @player2)
    winner = turn.winner
    turn.pile_cards
    self.display_turn_message(turn, winner)
    turn.award_spoils(winner)
  end

  def check_for_winner
    if @turn_count >= 1_000_000
      self.abort("---- DRAW ----")
    elsif @player1.has_lost? || @player2.has_lost?
      self.declare_winner
      exit
    end
  end

  def display_turn_message(turn, winner)
    if turn.type == :basic
      puts "Turn #{@turn_count}: #{winner.name} won #{turn.spoils_of_war.count} cards"
    elsif turn.type == :war
      puts "Turn #{@turn_count}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards"
    else
      puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def declare_winner
    if @player1.has_lost?
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    else
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  end
end
