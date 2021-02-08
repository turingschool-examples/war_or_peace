class Game
  attr_reader :player1, :player2, :hand 

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
  end

  def start_a_war
    hand = 1
    result = nil
    until player1.has_lost? == true || player2.has_lost? == true
      turn = Turn.new(player1, player2)
      @result = turn.type
      if result == :mutually_assured_destruction
        victor = "No Winner"
      else
        victor = turn.winner
      end
      turn.winner
      turn.pile_cards
      turn.award_spoils(victor)
      if result == :mutually_assured_destruction
        p "Turn #{hand}: *mutually assured destruction* 6 cards removed from play"
      elsif result == :war
        p "Turn #{hand}: WAR - #{victor.name} won 6 cards"
      else
        p "Turn #{hand}: #{victor.name} won 2 cards"
      end
      p player1.deck.cards.size
      p player2.deck.cards.size
      hand +=1
      break if hand == 200001
    end
    end_the_war
  end

  def end_the_war
    if player1.has_lost? == true || player2.has_lost? == true
      p "*~*~*~* #{victor.name} has won the game! *~*~*~*"
    else
      p "---- DRAW ----"
    end
    p "Player 1 cards: " + player1.deck.cards.size.to_s
    p "Player 2 cards: " + player2.deck.cards.size.to_s
  end

end
