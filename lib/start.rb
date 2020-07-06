class Start

  def initialize
  end

  def start
    print "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Calvin and Hobbes.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    input = gets.chomp.to_s
    if input == "GO"
      p "start"
    else p "Not up for playing? Maybe next time."
    end
  end

end
