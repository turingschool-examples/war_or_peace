class Game
  attr_reader :player1,
              :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @count   = 0
  end



  def intro
    p "Welcome to War! (or Peace)." "This game will be played with 52 cards."
    p"The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "-------------------------------------------------------------"
  end

  def start
    while @count <= 1000000
      @count +=1
      turn = Turn.new(@player1, @player2)
      if turn.type == :mutually_assured_destruction
        winner = turn.winner
        p "Turn #{@count}: mutually assured destruction Stalement 6 cards have been destroyed"
        turn.pile_cards
      elsif turn.type == :war
        winner = turn.winner
        p "Turn #{@count}: #{turn.winner.name} won the battle and gains 6 cards."
        turn.pile_cards
        turn.award_spoils(winner)
      else turn.type == :basic
        winner = turn.winner
        p "Turn #{@count}: #{turn.winner.name} won the skirmish and gains 2 cards."
        turn.pile_cards
        turn.award_spoils(winner)
      end

      if player1.has_lost?
        p "*~*~*~*~ #{player2.name} has won the war. *~*~*~*~ "
        break
      elsif player2.has_lost?
        p  "*~*~*~*~ #{player1.name} has won the war. *~*~*~*~ "
        break
      end

      if @count == 1000000
        p "----Draw----"
      end
    end
  end
end
