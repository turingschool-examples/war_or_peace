class Game

  attr_reader :turn

  def initialize (turn)
    @turn = turn
    @ticker = 1
  end

  def start
    puts "Welcome to War! (or Peace, If youre lucky!)"
    puts "This game will be played with 52 cards."
    puts "The players today are Rick and Morty."
    puts "Type 'GO' to start the game!"
  end

  def play
    until turn.player1.has_lost? == true || turn.player2.has_lost? == true
      if @ticker == 1000001
        p "-----DRAW!!-----"
        break
      elsif @turn.type == :basic
        @turn.winner
        p "Turn #{@ticker}: #{turn.winner.name} won 2 cards!"
        turn.award_spoils
        @ticker += 1
      elsif turn.type == :war
        @turn.winner
        p "Turn #{@ticker}: *WAR* - #{turn.winner.name} won 6 cards!"
        turn.award_spoils
        @ticker += 1
      elsif turn.type == :mutually_assured_destruction
        p "Turn #{@ticker}: *MUTUALLY ASSURED DESTRUCTION* 6 cards removed from play :("
        turn.pile_cards
        @ticker += 1
      end
    end
    if turn.player1.has_lost? == true
      p "#{turn.player2.name} has won the game!"
    else turn.player2.has_lost? == true
      p "#{turn.player1.name} has won the game!"
    end
  end
end
