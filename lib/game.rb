class Game
  attr_reader :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @standard_deck = []
    @turn_count = 0
  end

  def create_decks
    suits = [:heart, :diamond, :club, :spade]
    suits.each do |suit|
      2.upto(10) do |number|
        @standard_deck << Card.new(suit, "#{number}", number)
      end
      @standard_deck << Card.new(suit, "Jack", 11)
      @standard_deck << Card.new(suit, "Queen", 12)
      @standard_deck << Card.new(suit, "King", 13)
      @standard_deck << Card.new(suit, "Ace", 14)
    end
    @standard_deck.shuffle!
    deck1 = @standard_deck[0..25]
    deck2 = @standard_deck[26..52]

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)

  end

  def welcome_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    print "--->  "
  end

  def winner_name
    @turn.winner.name
  end

  def turn_message(turn)
    if turn.type == :basic
      p "Turn #{@turn_count}: #{winner_name} won 2 cards"
    elsif turn.type == :war
      p "Turn #{@turn_count}: WAR - #{winner_name} won 6 cards"
    else
      p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def start
    create_decks
    welcome_message
    start = gets.chomp.upcase

    if start == "GO"
      @turn_count = 1
      until @player1.has_lost? || @player2.has_lost? do
        @turn = Turn.new(@player1, @player2)

        @turn.pile_cards
        @turn.award_spoils(@turn.winner)
        turn_message(@turn)

        @turn_count += 1
        if @turn_count == 1000000
          p "---- DRAW ----"
          break
        end
      end
      p "*~*~*~* #{winner_name} has won the game! *~*~*~*"
    end
  end


end
