class Game
  attr_reader :start, :turn_count, :status  
  attr_accessor :turn 
  def initialize(turn)
    # @start = start 
    @turn = turn 
    @turn_count = 0
    @status = false  
  end 

  def start 
    
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    input = gets.chomp 
    if input == 'GO'
      
      turn.print_deck
      

      until @turn_count > 1000000 || turn.player1.deck.cards.count==0 || turn.player2.deck.cards.count==0
        # || player1.has_lost? == true || player2.has_lost? == true 
     
        puts "Turn #{@turn_count}:"
        if turn.type == :autowin1
          puts "player1 wins"
        elsif turn.type == :autowin2
          puts "player2 wins"
        else
        
          turn.print_deck
          # turn.winner_status
          @turn_count += 1 
          #turn.type
          winner = turn.winner
          turn.turn_results 
          turn.pile_cards
          #turn.spoils_of_war
          #puts turn.spoils_of_war
          turn.award_spoils(winner)
          #turn.empty_spoils
          # turn.turn_results
          #puts turn.award_spoils(winner)
          
          #turn.print_deck
          #turn.spoils_of_war = []
          # turn.empty_the_spoils
          #turn.turn_results
          # turn.winner_status
    
          # @turn_count += 1 
        end 
      end 

      if @turn_count > 1000000
        puts "---- DRAW ----"
      elsif turn.player1.deck.cards.count==0 
        puts "*~*~* #{turn.player2.name} has won the game! *~*~*"
      elsif turn.player2.deck.cards.count==0 
        puts "*~*~* #{turn.player1.name} has won the game! *~*~*"
      end
      #turn happens
      # turn_count += 1
    else
      puts 'Try again, type "GO"' 
    end 
  end 
end 
# game1 = Game.new()
# game1.start 
#turn.type 

# || cards.rank_of_card_at[0] == [] 
 # suits = [:heart, :diamond, :spade, :club]
    # values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    # ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1]
      
    # cards = []
    # suits.each do |suit|
    #   values.each do |value|
    #     # cards << [suits: suit, values: value, ranks: ranks[values.find_index(value)]]
    #     card1 = Card.new(suit, value, ranks[values.find_index(value)])
    #     cards << card1 
    #     #maybe use card instead of card1
      
    #   end
      
    # end




    #   two_decks = []
    #   two_decks = cards.shuffle.each_slice(26).to_a
    #   deck1 = Deck.new(two_decks[0])
    #   deck2 = Deck.new(two_decks[1])
    #   player1 = Player.new('Megan', deck1)
    #   player2 = Player.new('Aurora', deck2)