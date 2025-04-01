class Game

  attr_reader :has_started, :game_over, :player1, :player2, :deck1, :deck2

  def initialize()
    @has_started = false
    @game_over = false
  end

  # upon startup, print to console:
  def start
   
    puts "------------------------------------------------------------------"
    # welcome message with game title and other details
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    # player introduction
    puts "The players today are Megan and Aurora."
    # command for user input to start playing
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    @input = gets.chomp.upcase

    if @input == "GO" && @has_started == false
      # create instances of cards, decks, players
      # start gameplay loop
      setup_game
      play_game
      
    elsif @input != "GO" && @has_started == false
      puts "Wait! You haven't started playing yet!"
      puts "Type 'GO' to start the game or 'HELP' for more options."
      input.upcase
    else @input != "GO" || @has_started == true
      puts "Invalid input. Type 'HELP' for more options."
      @input.upcase
    end
  end

  def setup_game
    @has_started = true
    create_entire_deck
    @shuffled_deck = shuffle_deck(@entire_deck)
    @deck1, @deck2 = split_deck(@shuffled_deck)
    @player1, @player2 = create_players(@deck1, @deck2)
  end

# hard-coded card and player variables - iteration 3

  def create_entire_deck
    # define all the return values for each card attribute (suit, value, rank), local to this method
    all_suits = [:heart, :diamond, :spade, :club]
    all_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    all_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
      # refactor note - since the aces are high and the first value is 2, i wonder if there's a way to do something like index position + 2

      # additional refactor note, I was initially looking into using the Range method for the array (https://ruby-doc.org/3.4.1/Range.html)
      # but couldn't quite figure it out here, but I imagine it would probably function similarly, where I just specify the starting
      # and ending index position based on the maximum array length which would be 13 so maybe like `all_values = (0..13).to_a`
      # but wasn't sure how to loop it from there

    # declare the starting value of the entire_deck as an empty array
    @entire_deck = []

    # since there maximum length any attribute arrays, I should be able to just loop it 13 times per suit to create all 52 cards
    
    13.times do |index|
      # declare the value and rank variables as the element in the index position for each loop (like '2' and 2)
      value = all_values[index]
      rank  = all_ranks[index]

      # for each value/rank pair (like '2' and 2), make a card for every suit
      all_suits.each do |suit|
        card = Card.new(suit, value, rank)
        card_number = @entire_deck.length + 1
        #just to check the return value for each card, making sure that all the cards are being created correctly based on their attributes
        puts "@card#{card_number} = [#{card.suit}, #{card.value}, #{card.rank}]"
        @entire_deck.push(card)
      end
    end
  end

  def shuffle_deck(entire_deck)
    @entire_deck.shuffle
  end

  # I was able to get the array method for range working here though to split them easily enough after shuffling
  # where the first 26 cards (index position 0 through 25) were in deck1_cards and the second 26 cards (index position 26 through 51) were in deck2_cards
  # then when I call that method, it will declare new instance variables with each deck having half of the already-shuffled cards
  def split_deck(shuffled_deck)
    [shuffled_deck[0...26], shuffled_deck[26...52]]
  end

  # refactor note to see how to emulate "dealing" the cards in a manner similar to how they are dealt in real life, 
  # by alternating players instead of just cutting the deck in half after shuffling like I did above
    
  # create new instances of the each player   
  def create_players(deck1, deck2)
    @player1 = Player.new("Megan", Deck.new(@deck1))
    @player2 = Player.new("Aurora", Deck.new(@deck2))
    [@player1, @player2]
  end

  def play_game
    # safeguard the loop from "undefined method for nil:NilClass" NoMethodErrors
    # make sure that both players exist before executing the loop
    return if @player1.nil? || @player2.nil?

    # set initial turn count to 1
    turn_count = 1

    # loop through turns until one player loses or 1,000,000 turns have happened
    until @player1.has_lost? || @player2.has_lost? || turn_count >= 1000000
        
      turn = Turn.new(@player1, @player2)
      winner = turn.winner
      
      turn.pile_cards
      turn.award_spoils(winner)

      # print results for each turn, printing the turn number, turn type, turn winner name, and how many cards they won
      if turn.type == :basic
        if winner != "No Winner"
        # for a :basic turn type, 2 cards were added to the pile_cards, so 2 cards are added to the spoils_of_war, then added to the winner's deck
          puts "Turn #{turn_count}: #{winner.name} won 2 cards"
          #=> "Turn 1: Megan won 2 cards"
        end
      elsif turn.type == :war
        if winner != "No Winner"
        # for a :war turn type, 6 cards were added to the pile_cards, so 2 cards are added to the spoils_of_war, then added to the winner's deck
          puts "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
          #=> "Turn 2: WAR - Aurora won 6 cards"
        end
      elsif turn.type == :mutually_assured_destruction
        # for a :mutually_assured_destruction turn type, 6 cards were remove from play and NOT added to the pile_cards, meaning no cards get added to spoils_of_war
          puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
          #=> Turn 3: *mutually assured destruction* 6 cards removed from play
      end

      turn_count += 1
    end
    
    # determine winner by calling the winner method from the Turn class
    # and checking the has_lost? method on the Player class after each turn
    # if one player has an empty deck after the turn ends, the game is over and a winner is declared
    if @player1.has_lost?
      @game_over = true
      puts "#{@player1.name} has no cards remaining in their deck."
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost?
      @game_over = true
      puts "#{@player2.name} has no cards remaining in their deck."
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    elsif
      # if there have been at least 1,000,000 turns when this check happens,
      # the game ends in a draw
      turn_count  >= 1000000 && @game_over = true
      puts "---- DRAW ----"
  end

end



# notes for additional improvements and future refactors to increase complexity
  # not sure if i need to use an attr_writer or attr_accessor?

# as a part of the "GO" input, could have some conditional follow-up inputs to vary the nuumber of players and decks
# if i do this i need to add the instance variables to the initialize method with default return values, maybe like this
   #@deck_size = 52
   #@player_count = 2

   # prompt user to input how many cards they want to begin with in each player's deck
      #puts "Deck size = #{@deck_size}"
      # prompt user to input how many players will be playing
      #puts "Player count = #{@player_count}"
      
  # and then maybe defining a method for create_decks where it creates decks and splits the cards between the number of players

  # maybe these methods for the "GO" logic above
  # def deck_size
  #   @deck_size = deck_size
  #   @input
  # end

  # def player_count
  #   @player_count = player_count
  # end

  # can also make a more expansive help menu that has other input commands and allows the user to change game settings, ideas below
    # def help
    #   if input == "HELP" && @has_started == true && @game_over = true
    #     #EXIT, SCORE, RESTART, EDIT_CONFIG = @deck_size, @player_count
    #   end
    # end

  # or add logic to check for the state/outcome of the game to conditionally offer more inputs to play again or maybe store a leaderboard across games

    # elsif @has_started == true && @player.has_lost == true
      # puts "Maybe next time! Want to play again?"
      # puts "Type 'GO' to start the game!"
    # elsif @input == "RESTART"
   
end