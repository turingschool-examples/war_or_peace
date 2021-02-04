class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome_message
    puts "      Welcome to War! (or Peace) This game will be played
      with 52 cards.
      The players today are #{@player1.name} and #{@player2.name}.
      Type 'GO' to start the game!
      ________________________________________________________"
  end

  def start
    turn = Turn.new(@player1, @player2)
      if turn.type == :mutually_assured_destruction
        puts 'Turn 3: *mutually assured destruction*
              No cards for anyone.
              6 cards go bye bye and removed from play'
      elsif turn.type == :war
        puts "Turn 2: #{turn.winner.name} cleaning house and sticky fingering 6 cards"
      else turn.type == :basic
        puts "Turn 1: #{turn.winner.name} inching towards winning and claiming 2 cards"
      end
  end
end
