class Game 

  attr_reader :turn_count, :deck_of_cards, :player_1, :player_2

  def initialize 
    @turn_count = 0
    @deck_of_cards = create_cards
    @player_1 = create_player_one
    @player_2 = create_player_two
  end

  def create_cards 
 
    card_1 = Card.new(:heart, '9', 9)
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, 'Jack', 11)
    card_4 = Card.new(:heart, 'Queen', 12)

    card_5 = Card.new(:diamond, '9', 9)
    card_6 = Card.new(:diamond, '10', 10)
    card_7 = Card.new(:diamond, 'Jack', 11)
    card_8 = Card.new(:diamond, 'Queen', 12)

    card_9 = Card.new(:spade, '9', 9)
    card_10 = Card.new(:spade, '10', 10)
    card_11 = Card.new(:spade, 'Jack', 11)
    card_12 = Card.new(:spade, 'Queen', 12)

    card_13 = Card.new(:club, '9', 9)
    card_14 = Card.new(:club, '10', 10)
    card_15 = Card.new(:club, 'Jack', 11)
    card_16 = Card.new(:club, 'Queen', 12)
    

    cards = [card_1, card_2, card_3, card_4, card_5, card_6,
             card_7, card_8, card_9, card_10, card_11, card_12, 
             card_13, card_14, card_15, card_16]
    cards.shuffle!                  
  end 

  # def set_up 
  #   # @deck_of_cards.shuffle! 
  #   # deck_1 = Deck.new(@deck_of_cards[0..7])
  #   deck_2 = Deck.new(@deck_of_cards[7..15]) 
    

  #   # player_1 = Player.new("Megan", deck_1)
  #   player_2 = Player.new("Aurora", deck_2)
    
  # end 

  def create_player_one 
    deck_1 = Deck.new(@deck_of_cards[0..7])
    player_1 = Player.new("Megan", deck_1)
  end 

  def create_player_two
     deck_2 = Deck.new(@deck_of_cards[7..15]) 
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
    
    turn = Turn.new(@player_1, @player_2)
    turn_type = turn.type 

    while (player_1.has_lost? == false) && (player_2.has_lost? == false) && (@turn_count <= 1_000_000)
      if turn.type == :basic 
      
        puts "Turn #{@turn_count}: #{turn.winner.name} won 2 cards"
        winner = turn.winner 
        turn.pile_cards 
        turn.award_spoils(winner) 
        turn.spoils_of_war.clear
        
        
      elsif turn_type == :war 

        turn.type == :basic #|| turn.type == :war
        #@turn_count += 1
        puts "Turn #{@turn_count}: WAR #{turn.winner.name} won 6 cards"
        winner = turn.winner 
        turn.pile_cards 
        turn.award_spoils(winner) 
        turn.spoils_of_war.clear
        

      elsif turn.type == :mutually_assured_destruction 
        #@turn_count += 1 
        puts "Turn #{@turn_count}: *Mutually Assured Destruction* 6 cards removed from play" 
        turn.pile_cards 
        turn.spoils_of_war.clear
      end

        @turn_count += 1
    
      if @turn_count == 1_000_000 
         puts "=== DRAW ==="
         break
       end 
    end


  end
end