class War
  attr_reader :standard_deck
              :deck1
              :deck2
              :player1
              :player2
              :turn
              :cards1
              :cards2
  def initialize
    @standard_deck = StandardDeck.new
    @player_deck1 = @standard_deck.randomize[0]
    @player_deck2 = @standard_deck.randomize[1]
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts ------------------------------------------------------------------

      if gets.chomp == 'GO'
        #war.go
      elsif gets.chomp == 'go'
        #war.go
      else
        "Please enter go!"
      end
  end

  def go

    if turn.type == :basic
      puts "Turn 1: #{player1.name} won 2 cards"
    elsif turn.type == :war
      puts "Turn 2: #{player2.name} won 6 cards"

    elsif turn.type == :mutually_assured_destruction
      puts "Turn 3: *mutually assured destruction* 6 cards removed from play"
    end
  end
end
