require_relative 'card'
require_relative 'player'
require_relative 'turn'

class Game
  attr_reader :cards,
              :type_error,
              :total_turn_counter,
              :basic_turn_counter,
              :war_turn_counter,
              :mas_turn_counter

  def initialize
    @cards = Array.new
    @total_turn_counter = 1
    @basic_turn_counter = 0
    @war_turn_counter = 0
    @mas_turn_counter = 0
    @type_error = [
      'Error!',
      'Two valid players are required to start the game, please try again.'
    ]
  end

  def create_deck
    Card.new.valid_suits.each do |suit|
      Card.new.valid_values.each do |value, rank|
        if value != :numeric
          @cards << Card.new(suit, value, rank)
        elsif value == :numeric
          rank.each { |rank| @cards << Card.new(suit, rank.to_s, rank) }
        end
      end
    end
  end

  def shuffle_deck
    create_deck
    @cards = @cards.sample(52)
  end

  def split_deck
    [@cards[0..25], @cards[26..52]]
  end

  def increment_total_turns
    @total_turn_counter += 1
  end

  def increment_basic_turns
    @basic_turn_counter += 1
  end

  def increment_war_turns
    @war_turn_counter += 1
  end

  def increment_mas_turns
    @mas_turn_counter += 1
  end

  def print_type_error
    @type_error.each { |line| line }
  end

  def print_welcome(player1, player2)
    prompt = [
      "\nWelcome to War! (or Peace) This game will be played with #{@cards.length} cards.",
      "The players today are #{player1.name} and #{player2.name}.",
      "Type 'GO' to start the game!",
      "-"*50,
      " >"
    ]
    prompt.each { |line| line }
  end

  def greet(player1, player2)
    player1.class == Player && player2.class == Player ? print_welcome(player1, player2) : print_type_error
  end

  def new_turn(player1, player2)
    Turn.new(player1, player2)
  end

  def run_turn(current_turn)
    type = current_turn.type
    winner = current_turn.winner
    current_turn.pile_cards
    cards_won = current_turn.spoils_of_war.length
    current_turn.award_spoils(winner)
    [type, winner, cards_won]
  end

  def start(player1, player2)
    until player1.has_lost? || player2.has_lost? || @total_turn_counter == 1001
      current_turn = new_turn(player1, player2)
      turn_results = run_turn(current_turn)
      if turn_results[0] == :mutually_assured_destruction
        puts "Turn #{@total_turn_counter}: *mutually assured destruction* 6 cards removed from play"
        increment_mas_turns
      elsif turn_results[0] == :war
        puts "Turn #{@total_turn_counter}: WAR - #{turn_results[1].name} won #{turn_results[2]} cards"
        increment_war_turns
      elsif turn_results[0] == :basic
        puts "Turn #{@total_turn_counter}: #{turn_results[1].name} won #{turn_results[2]} cards"
        increment_basic_turns
      end
      increment_total_turns
    end
    end_game(player1, player2)
  end

  def end_game(player1, player2)
    if player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      puts "---- DRAW ----"
    end
    puts print_results(player1, player2)
  end

  def print_results(player1, player2)
    results = [
      "\nFinal results:",
      "-"*20,
      "#{player1.name} has #{player1.deck.cards.length} cards.",
      "#{player2.name} has #{player2.deck.cards.length} cards.",
      "-"*20,
      "#{@basic_turn_counter} total 'basic' turns.",
      "#{@war_turn_counter} total 'war' turns.",
      "#{@mas_turn_counter} total 'mutually assured destruction' turns."
    ]
    results.each { |result| result }
  end

end
