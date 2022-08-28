class Game
  attr_reader :start, :turn, :turn_count, :status  
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
      

      until @turn_count == 10 
        # || player1.has_lost? == true || player2.has_lost? == true 
     
        p "Turn #{@turn_count}:"
        # turn.winner_status
        turn.type
        turn.pile_cards
        turn.winner
        turn.award_spoils()
        turn.turn_results
        # turn.winner_status
    
        @turn_count += 1  
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