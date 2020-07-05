class Game

  attr_accessor :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  # Write start method here
  def start
    # I know I need a get chomp to get player names
    # I will need a get chomp to start the game
    p "Welcome to War! (or Peace). This game will be played with 52 cards."
    p "Player 1, enter your name"
    puts "> "
    player_1 = $stdin.gets.chomp
    p "Player 2, enter your name"
    puts "> "
    player_2 = $stdin.gets.chomp
    p "The players today are #{player_1} and #{player_2}"
    p "Type 'GO' to start the game! (type 'EXIT' to leave the game...)"
    p "-------------------------------------------------"
    user_input_start = ""
    user_input_start = gets.chomp
    if user_input_start.upcase == "GO"
      # start game
      p "#{player_1} and #{player_2} declare WAR!"
      user_start
    elsif user_input_start.upcase == "EXIT"
      exit
    else
      # start welcome message over
      p "Misfire... read the instructions next time :)"
      start
    end
  end

  # Ugghhh.. how do I begin the game?
  # Okay... so we came here after the game.start method was called
  # We can pull Class player parameter of @name from game.start chomp
  # runner file has deck of cards created, shuffled, then assigned to two decks
  # Project says:
  # Turn 1: Megan won 2 cards
  # Turn 2: WAR - Aurora won 6 cards
  # Turn 3: *mutually assured destruction* 6 cards removed from play
  # ...
  # ...
  # ...
  # Turn 9324: Aurora won 2 cards
  # *~*~*~* Aurora has won the game! *~*~*~*
  # NOTE - only 1,000,000 turns will be allowed.
  # If no player has all cards after 1,000,000 turns,
  # the result of the game is a draw.
  def user_start
    # Creates instance of turn class, since this mostly has to do with turns
    # May also use player class
    turn = Turn.new(player_1, player_2)
    # Realized I needed something to account for the 100000 max turn rule
    turn_counter = 0
    # Researched loops
    # While - as long as 'something' is true, this will run
    # For - preffered when you know the number of loops
    # Do..While - loop do has a condition and then a break point (exit controlled loop)
    # Until - as long as 'something' is false, will run

    # until seems best (will run until the Player Class method has_lost?
    # returns true.)
    # Tested! After closing it, it works!!
    until (player_1.has_lost? || player_2.has_lost?)
      if turn.type == :basic
        # Looking at my turn class for hints
        # I can work with .type, .winner, .pile_cards, .award_spoils(winner)

        # This will call method to return the winning player
        winner = turn.winner
        # This will call method to add to spoils_of_war array`
        turn.pile_cards
        # This will call method to add and remove correct cards to player decks
        turn.award_spoils(winner)
        turn_counter += 1
        p "Turn ##{turn_counter}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turn_counter += 1
        p "Turn ##{turn_counter}: WAR - #{winner.name} won 6 cards"
      elsif turn.type == :mutually_assured_destruction
        turn.winner
        turn.pile_cards
        turn_counter += 1
      else
        p "OOOOOOOPS! MISTAKE IN USER_START METHOD"
      end

      # every time the turn instance runs, it will add on a +1 to the turn_counter
      # This will cause the until to stop once turn_counter = 100000
      break if turn_counter == 100000
    end
  end
end
