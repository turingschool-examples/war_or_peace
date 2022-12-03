class Game 

  attr_reader :turn_count, :deck_of_cards, :player_1, :player_2, :turn

  def initialize 
    @turn_count = 1
    @deck_of_cards = create_cards
    @player_1 = create_player_one
    @player_2 = create_player_two
    @turn = Turn.new(@player_1, @player_2)
  end

  def create_cards 
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards 
    5.times { cards.shuffle! } 
    cards                
  end 

  def create_player_one 
    deck_1 = Deck.new(@deck_of_cards[0..25])
    player_1 = Player.new("Megan", deck_1)
  end 

  def create_player_two
     deck_2 = Deck.new(@deck_of_cards[26..51]) 
     player_2 = Player.new("Aurora", deck_2)
  end 

  def display_welcome_message 
    "
    --------------------------------------------------------------------\n
    Welcome to War! (or Peace) This game will be played with #{@deck_of_cards.count} cards.
    The players today are #{@player_1.name} and #{@player_2.name}.
    Type 'GO' to start the game!\n
    --------------------------------------------------------------------
    "
  end 

  def initiate_war 
    turn_type = @turn.type 

    while (player_1.has_lost? == false) && (player_2.has_lost? == false) && (@turn_count <= 1_000_000)
      if @turn.type == :basic 
        basic_turn_sequence
        
      elsif turn_type == :war 
        war_turn_sequence

      elsif @turn.type == :mutually_assured_destruction 
        mutually_assured_destruction_turn_sequence
      end

      @turn_count += 1 
    end

    puts game_result_display
  end

  def start 
    user_input = gets.chomp.upcase

    if user_input == "GO"
      initiate_war
    else 
      puts "\nHahaha. I said type GO, not '#{user_input}'. Try again next time!!"
    end
  end

  def basic_turn_sequence 
    puts "Turn #{@turn_count}: #{@turn.winner.name} won 2 cards"
    winner = @turn.winner 
    @turn.pile_cards 
    @turn.award_spoils(winner) 
    @turn.spoils_of_war.clear
  end

  def war_turn_sequence 
    puts "Turn #{@turn_count}: WAR #{@turn.winner.name} won 6 cards"
    winner = @turn.winner 
    @turn.pile_cards 
    @turn.award_spoils(winner) 
    @turn.spoils_of_war.clear
  end

  def mutually_assured_destruction_turn_sequence
    puts "Turn #{@turn_count}: *Mutually Assured Destruction* 6 cards removed from play" 
    @turn.pile_cards 
    @turn.spoils_of_war.clear
  end 

  def game_result_display 
     if @turn.player1.has_lost?
       "\n*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
    elsif @turn.player2.has_lost?
        "\n*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
    else 
       
       "\nTurn: #{@turn_count - 1}
       \n========== DRAW =========="  
    end
  end
end 