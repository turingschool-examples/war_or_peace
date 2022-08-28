class Game
  attr_reader :player1, :player2
  def initialize
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Mehlub and Andrew."
    p "Type 'GO' to start the game!"
    p "---------------------------------------------------------------------"
    user = gets.chomp

    if user == "GO"
      play
    else
      puts "Type G then O"
    end
  end

  def play
    play_count = 0
    move = Turn.new(player1, player2)

    until player1.has_lost? || player2.has_lost?
      if move.type == :basic
        winner = move.winner
        move.pile_cards
        move.award_spoils(winner)
        play_count += 1
        p "Turn #{play_count}: #{winner.name} won 2 cards"
      end
    end
  end
end
