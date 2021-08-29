class StartGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    #winner = @player1
    turn_num = 1
    draw_test = 1
    while turn_num <= 1000000 do
      turn = Turn.new(@player1, @player2)

      #turn.pile_cards
      winner = turn.winner

      turn_type = turn.type

      turn.pile_cards

      turn.award_spoils(winner)

      if player1.deck.cards.count == 3 || player2.deck.cards.count == 3

        if turn_type == :basic
          p "Turn #{turn_num}: #{winner.name} won 2 cards"
        elsif turn_type == :war
          p p "Turn #{turn_num}: WAR - #{winner.name} won 6 cards"
        else
          p "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play"
          draw_test = 1000000
        end

      turn_num = 1000000

      elsif turn_type == :basic
        p "Turn #{turn_num}: #{winner.name} won 2 cards"
      elsif turn_type == :war
        p "Turn #{turn_num}: WAR - #{winner.name} won 6 cards"
      elsif turn_type == :mutually_assured_destruction
        p "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play"
        winner = @player1
      else
        p "error: no turn type"
        winner = @player1
      end

      draw_test += 1
      turn_num += 1

      p "#{player1.name} has #{player1.deck.cards.count} cards"
      p "#{player2.name} has #{player2.deck.cards.count} cards"
    end

    if draw_test == 1000001
      p "----- DRAW -----"
    else
      p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    end
  end
end
