class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @count = 0
  end

  def start
    puts "      Welcome to War! (or Peace) This game will be played
      with 52 cards.
      The players today are #{@player1.name} and #{@player2.name}.
      Type 'GO' to start the game!
      ________________________________________________________"
  end

  def play
    while @count <= 1000000
      @count += 1
      turn = Turn.new(@player1, @player2)

      if turn.type == :mutually_assured_destruction
        p "Turn #{@count}: *mutually assured destruction* 3 cards from each of your decks making their way to el garbagio."
        winner = turn.winner
        turn.pile_cards
      elsif turn.type == :war
        p "Turn #{@count}: #{turn.winner.name} wins this --*WAR*-- and sweeps up 6 cards."
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
      else turn.type == :basic
        p "Turn #{@count}: #{turn.winner.name} takes this round and pockets 2 cards."
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
      end

      if @player1.has_lost? && !@player2.has_lost?
          p "#{@player2.name} has won the game!"
          break
      elsif @player2.has_lost? && !@player1.has_lost?
          p "#{@player1.name} has won the game!"
          break
      else
        if @count == 1000000
          p "- DRAW - - - NOBODY WINS - - - DRAW -"
          break
        end
      end
    end
  end
end
