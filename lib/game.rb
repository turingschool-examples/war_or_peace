class Game
  attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
  end

  def start_a_war
    line = 1
    result = nil
    # until player1.deck.cards.size == 3 || player2.deck.cards.size == 3
    #   turn = Turn.new(player1, player2)
    #     p player1.deck.cards.size
    #     p player2.deck.cards.size
    #   turn.type # result = turn.type
    #   # p result
    #   victor = turn.winner
    #   turn.pile_cards
    #   turn.spoils_of_war
    #   turn.award_spoils(victor)
    #     line +=1
    #   break if line == 201
    # end
    # require "pry"; binding.pry
    until player1.has_lost? == true || player2.has_lost? == true
      turn = Turn.new(player1, player2)
      result = turn.type      #   turn.type # result = turn.type
      if result == :mutually_assured_destruction
        victor = "No Winner"
      else
        victor = turn.winner
      end
      turn.pile_cards
      turn.award_spoils(victor)
      if result == :mutually_assured_destruction
        p "Turn #{line}: *mutually assured destruction* 6 cards removed from play"
        # require "pry"; binding.pry
      elsif result == :war
        p "Turn #{line}: WAR - #{victor.name} won 6 cards"
      else
        p "Turn #{line}: #{victor.name} won 2 cards"
      end
      p player1.deck.cards.size
      p player2.deck.cards.size
      line +=1
      break if line == 201
    end
    end_the_war
    # require "pry"; binding.pry
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
