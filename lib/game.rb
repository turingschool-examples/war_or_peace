class Game
  attr_reader :current_turn, :turn_count, :turn_return
  def initialize(current_turn)
    @current_turn = current_turn
    @turn_count = 1
    @turn_return = nil
  end

  # Determine if a player has 0 cards in their deck
  def the_end?
    if @current_turn.player_one.has_lost? || @current_turn.player_two.has_lost?
      true
    end
  end

  # Execute the game. :loss turn_type will cover edge case wherein MAD turn is triggered and one player has insufficient cards to complete it.
  # Require further testing. Unknown if it is mathmaticaly possible for both players to have insufficient cards to complete a MAD turn.
  def run
    while @turn_count != 1_000_000 do
      @current_turn.type
      @current_turn.winner
      @current_turn.pile_cards
      @current_turn.spoils_of_war
      
      if @current_turn.turn_type == :basic
        puts "Turn #{@turn_count}: Basic - #{@current_turn.turn_winner.name} wins #{@current_turn.spoils_of_war.length} cards."
        @turn_return = "Turn #{@turn_count}: Basic - #{@current_turn.turn_winner.name} wins #{@current_turn.spoils_of_war.length} cards."
      elsif @current_turn.turn_type == :war
        puts "Turn #{@turn_count}: WAR! - #{@current_turn.turn_winner.name} wins #{@current_turn.spoils_of_war.length} cards."
        @turn_return = "Turn #{@turn_count}: WAR! - #{@current_turn.turn_winner.name} wins #{@current_turn.spoils_of_war.length} cards."
      elsif @current_turn.turn_type == :mutually_assured_destruction
        puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
        @turn_return = "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
      elsif @current_turn.turn_type == :loss
        if @current_turn.player_one.deck.card_list.length > @current_turn.player_two.deck.card_list.length
          puts "*~*~*~* #{@current_turn.player_one.name} has won the game! *~*~*~*"
          break
        elsif current_turn.player_one.deck.card_list.length < @current_turn.player_two.deck.card_list.length
          puts "*~*~*~* #{@current_turn.player_two.name} has won the game! *~*~*~*"
          break
        end
      end

      @current_turn.award_spoils
      @turn_count += 1

      if the_end? == true
        puts "*~*~*~* #{@current_turn.turn_winner.name} has won the game! *~*~*~*"
        break
      elsif @turn_count == 1_000_000
        puts "--- DRAW ---"
        break
      end
    end
  end

  # Loop to ensure correct user input
  def start
    puts 'Type "GO" to start the game!'
    loop do 
      puts '-------------------------------------------------------------------'
      user_input = gets.chomp.downcase
      if user_input == 'go'
        self.run
        break
      else
        puts 'Not a valid input. Please type "GO"'
      end
    end
  end
end