require './lib/turn'
require './lib/card_generator'

def setup_deck
  card_gen = CardGenerator.new('card.txt')
  deck = card_gen.create_cards

  deck.shuffle!

  @deck1 = Deck.new(deck.slice(0, 26))
  @deck2 = Deck.new(deck.slice(27, 52))
end

def setup_players
  @player1 = Player.new("Megan", @deck1)
  @player2 = Player.new("Aurora", @deck2)
end #end of setup_players

def welcome_message
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "The players today are Megan and Aurora"
  puts "Type 'GO' to start the game or 'EXIT' to quit."
end #end of welcome_message

def play_game
  turn = Turn.new(@player1, @player2)

  turn_counter = 1

  until @player1.has_lost? || @player2.has_lost?
    if turn.type == :basic
      turn.winner
      turn.pile_cards
        puts "Turn #{turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
      turn.award_spoils
      turn_counter += 1

    elsif turn.type == :war
      turn.winner
      turn.pile_cards
        puts "Turn #{turn_counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
      turn.award_spoils
      turn_counter += 1

    elsif turn.type == :mutually_assured_destruction
      turn.pile_cards
      puts "Turn #{turn_counter}: *mutually assured destruction* - 6 cards removed from play"
      turn_counter += 1

    elsif turn.type == :lost1
      puts "#{@player1.name} ran out of cards!"
      puts "*~*~*~* #{@player2.name} has won the game *~*~*~*"
      break

    elsif turn.type == :lost2
      puts "#{@player2.name} ran out of cards!"
      puts "*~*~*~* #{@player1.name} has won the game *~*~*~*"
      break
    end
    break if turn_counter == 1000000
  end

  #print winner statement after player has won game
  if @player1.has_lost?
    puts "*~*~*~* #{@player2.name} has won the game *~*~*~*"
  elsif @player2.has_lost?
    puts "*~*~*~* #{@player1.name} has won the game *~*~*~*"
  elsif turn_counter == 1000000
    puts "---- DRAW ----"
  end

end #end of play_game

#--------------------------------------------------------

welcome_message

exit_condition = false

until exit_condition == true
  puts "------------------------------------------------------------------"

  print "\nPROMPT: "
  user_input = gets.chomp.upcase

  if user_input == "GO"
    setup_deck
    setup_players
    play_game
  elsif user_input == "EXIT"
    puts "\nThanks for playing! Bye!"
    exit_condition == true
    break
  else
    puts "\nInvalid input! Try again."
  end
end
