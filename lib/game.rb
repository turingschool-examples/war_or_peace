require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2, :base_deck, :num_of_basics, :num_of_wars, :num_of_mads, :outcome

  def initialize(player1_name, player2_name, base_deck = self.default_base_deck)
    @player1 = Player.new(player1_name, Deck.new([]))
    @player2 = Player.new(player2_name, Deck.new([]))
    @base_deck = base_deck
    @num_of_basics = 0
    @num_of_wars = 0
    @num_of_mads = 0
    @has_started = false
    @game_over = false
    @outcome = 'UNDETERMINED'
    @banished_card_count = 0
  end

  def has_started?
    @has_started
  end

  def game_over?
    @game_over
  end

  def default_base_deck
    Deck.new([
      Card.new(:hearts, 'Two', 2),
      Card.new(:hearts, 'Three', 3),
      Card.new(:hearts, 'Four', 4),
      Card.new(:hearts, 'Five', 5),
      Card.new(:hearts, 'Six', 6),
      Card.new(:hearts, 'Seven', 7),
      Card.new(:hearts, 'Eight', 8),
      Card.new(:hearts, 'Nine', 9),
      Card.new(:hearts, 'Ten', 10),
      Card.new(:hearts, 'Jack', 11),
      Card.new(:hearts, 'Queen', 12),
      Card.new(:hearts, 'King', 13),
      Card.new(:hearts, 'Ace', 14),

      Card.new(:spades, 'Two', 2),
      Card.new(:spades, 'Three', 3),
      Card.new(:spades, 'Four', 4),
      Card.new(:spades, 'Five', 5),
      Card.new(:spades, 'Six', 6),
      Card.new(:spades, 'Seven', 7),
      Card.new(:spades, 'Eight', 8),
      Card.new(:spades, 'Nine', 9),
      Card.new(:spades, 'Ten', 10),
      Card.new(:spades, 'Jack', 11),
      Card.new(:spades, 'Queen', 12),
      Card.new(:spades, 'King', 13),
      Card.new(:spades, 'Ace', 14),

      Card.new(:clubs, 'Two', 2),
      Card.new(:clubs, 'Three', 3),
      Card.new(:clubs, 'Four', 4),
      Card.new(:clubs, 'Five', 5),
      Card.new(:clubs, 'Six', 6),
      Card.new(:clubs, 'Seven', 7),
      Card.new(:clubs, 'Eight', 8),
      Card.new(:clubs, 'Nine', 9),
      Card.new(:clubs, 'Ten', 10),
      Card.new(:clubs, 'Jack', 11),
      Card.new(:clubs, 'Queen', 12),
      Card.new(:clubs, 'King', 13),
      Card.new(:clubs, 'Ace', 14),

      Card.new(:diamonds, 'Two', 2),
      Card.new(:diamonds, 'Three', 3),
      Card.new(:diamonds, 'Four', 4),
      Card.new(:diamonds, 'Five', 5),
      Card.new(:diamonds, 'Six', 6),
      Card.new(:diamonds, 'Seven', 7),
      Card.new(:diamonds, 'Eight', 8),
      Card.new(:diamonds, 'Nine', 9),
      Card.new(:diamonds, 'Ten', 10),
      Card.new(:diamonds, 'Jack', 11),
      Card.new(:diamonds, 'Queen', 12),
      Card.new(:diamonds, 'King', 13),
      Card.new(:diamonds, 'Ace', 14)
      ])
  end

  def assign_base_deck(deck)
    @base_deck = deck
  end

  def start
    @has_started = true
    puts @base_deck.cards.length
    puts "Welcome to War! (or Peace) This game will be played with #{@base_deck.cards.length} cards..."
    puts "The players today are #{@player1.name} and #{player2.name}"
    puts "Type 'GO to start the game!'"
    puts "------------------------------------------------------------------"
    input = $stdin.gets.chomp
    if input.upcase == 'GO'
      puts "How many turns would you like to play for?"
      num_of_turns = $stdin.gets.chomp.to_i
      if num_of_turns > 0
        puts "------------------------------------------------------------------"
        self.run(num_of_turns)
      else
        puts "Invalid number of turns. Exiting game..."
      end

    else
      puts "Input: #{input} was not recognized. Exiting game..."
    end

  end

  def run(num_of_turns)
    current_turn = 1

    initial_base_deck_size = @base_deck.cards.length
    partition1_size = initial_base_deck_size / 2
    partition2_size = initial_base_deck_size - partition1_size

    # puts "initial length of base_deck: #{initial_base_deck_size}"
    # puts "length of partition 1: #{partition1_size}"
    # puts "length of partition 2: #{partition2_size}"

    # give player1 half of base deck here
    for i in 0..(partition1_size - 1) do
      @player1.deck.add_card_to_bottom(@base_deck.remove_card_from_top)
    end
    # puts "player1 deck length: #{@player1.deck.cards.length}"

    # puts "remaining length of base deck: #{@base_deck.cards.length}"

    # give player2 remaining base deck here
    for i in 0..partition2_size - 1 do
      @player2.deck.add_card_to_bottom(@base_deck.remove_card_from_top)
    end
    # puts "player2 deck length: #{@player2.deck.cards.length}"

    # puts "remaining length of base deck: #{@base_deck.cards.length}"

    turn = Turn.new(@player1, @player2)

    puts "#{@player1.name}'s STARTING card count: #{@player1.deck.cards.length}\n#{@player2.name}'s STARTING card count: #{@player2.deck.cards.length}\n\n"

    for current_turn in 1..num_of_turns
      type = turn.type
      winner = turn.winner
      winner_name = ""

      if winner.class == Player
        winner_name = winner.name
      elsif winner.class == String
        winner_name = winner
      end

      turn.pile_cards
      pile_size = turn.spoils_of_war.cards.length
      trashcan_size = turn.trashcan.cards.length

      print "Turn #{current_turn}: "

      case type
      when :basic
        @num_of_basics += 1
        puts "#{winner_name} won #{pile_size} cards!"
        turn.award_spoils(winner)
      when :war
        @num_of_wars += 1
        puts "WAR - #{winner_name} won #{pile_size} cards!"
        turn.award_spoils(winner)
      when :mutually_assured_destruction
        @num_of_mads += 1
        puts "*mutually assured destruction* #{trashcan_size} cards removed from play!"
        @banished_card_count += trashcan_size
        turn.award_spoils(winner)
      else
        # if this else gets triggered type has an invalid value
      end

      puts "#{@player1.name}'s CURRENT card count: #{@player1.deck.cards.length}\n#{@player2.name}'s CURRENT card count: #{@player2.deck.cards.length}\n\n"

      # check to see if someone won
      if @player1.deck.cards.length == 0 || @player2.deck.cards.length == 0
        if @player1.deck.cards.length == 0 && @player2.deck.cards.length == 0
          @game_over = true
          @outcome = "DRAW"
          break

        elsif @player1.deck.cards.length == 0
          @game_over = true
          @outcome = "#{@player1.name.upcase} WINS!"
          break

        else
          @game_over = true
          @outcome = "#{@player2.name.upcase} WINS!"
          break

        end

      end

    end

    # if nobody wins before all turns have been played, outcome results in draw]
    if @outcome == 'UNDETERMINED'
      @outcome = 'DRAW'
    end

    puts "*~*~*~* #{@outcome} *~*~*~*\n\n"

    puts "------------------------------------------------------------------"
    puts "#{@player1.name} - Remaining card count: #{@player1.deck.cards.length}"
    puts "#{@player2.name} - Remaining card count: #{@player2.deck.cards.length}"
    puts "Shadow Realm - Remaining card count: #{@banished_card_count}"
  end

end
