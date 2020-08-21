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
        @standard_deck << Card.new(:suit, "#{number}", number)
      end
      @standard_deck << Card.new(:suit, "Jack", 11)
      @standard_deck << Card.new(:suit, "Queen", 12)
      @standard_deck << Card.new(:suit, "King", 13)
      @standard_deck << Card.new(:suit, "Ace", 14)
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
    start = gets.chomp.upcase

  end

  def turn_message
    @turn_count + 1

  end

  def start
    create_decks
    # require "pry"; binding.pry
    welcome_message

  end


end
