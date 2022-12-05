class Game
  attr_reader :full_deck,
              :deck1,
              :deck2,
              :player1,
              :player2

  def initialize
    @full_deck = full_deck
    @deck1 = Deck.new(shuffle_deck[0..25])
    @deck2 = Deck.new(shuffle_deck[26..51])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @counter = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    start_game = gets.chomp.upcase

    if start_game == "GO"
      play_game
    else 
      p "Wrong input. Try again."
    end
    # start
  end   


  def game_output
    if @turn_type == :basic 
      p "Turn #{@count}: #{@turn_winner.name} won 2 cards"
    elsif @turn_type == :war
      p "Turn #{@count}: WAR - #{@turn_winner.name} won 6 cards"
    elsif @turn_type == :mutually_assured_destruction
      p "Turn #{@count}: *mutually assured destruction* 6 cards removed from play"
    else
    end
  end

  def full_deck
    build_deck
  end

  def build_deck 
    deck = []
    
    suits = [:diamond, :spade, :heart, :club]
    rank =  ('2'..'10').to_a + ['Jack', 'Queen', 'King', 'Ace']

    rank.each_with_index do |rank, index|
      suits.each do |suit|
        card = Card.new(suit, rank, index + 2)
        deck << card
      end
    end
    deck
  end

  def shuffle_deck
    full_deck.shuffle
  end

  def play_game
    until @counter == 1_000_000 || player1.has_lost? == true || player2.has_lost? == true
      loop do
        @counter += 1 

      turn = Turn.new(player1, player2)  
      @turn_type = turn.type
        if @turn_type == :basic || @turn_type == :war
          @turn_winner = turn.winner
        end
        turn.pile_cards
        spoils_count = turn.spoils_of_war.count
        turn.award_spoils(turn.winner)
        game_output
        if player1.has_lost?
          p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
          break
        elsif player2.has_lost?
          p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
          break
        end

        if @count == 1_000_000
          p "DRAW"
          break
        end
      end
    end 
  end
end  


