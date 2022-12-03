class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{turn.player1.name} and #{turn.player2.name}"
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    choice = gets.chomp.to_s
    choice.downcase == 'go' ? output_game : start
  end


  def output_game
    
    i = 0
    100_000_000.times do
     i += 1

     if turn.type == :basic || turn.type == :war
      p "Turn #{i}: #{turn.winner.name} won #{turn.pile_cards.length} cards"
     else
      p "Turn #{i}: *mutually assured desctruction* #{turn.pile_cards.length} removed from play."
     end 


    #  if turn.type == :basic
    #   p "#{turn.winner.name} won #{turn.pile_cards.length} cards"
    #   turn.pile_cards
    #   turn.award_spoils(turn.winner)
    #  elsif turn.type == :war 
    #   p "WAR - #{turn.winner.name} won #{turn.pile_cards.length} cards"
    #   turn.pile_cards
    #   turn.award_spoils(turn.winner)
    #  else
    #   p "*mutually assured desctruction* #{turn.pile_cards.length} removed from play."
    #   turn.pile_cards
    #  end
   
    # p "#{turn.player1.name} has #{turn.player1.deck.cards.length} cards remaining, the last three cards, top first are #{turn.player1.deck.cards[0].value}"
    # p "#{turn.player2.name} has #{turn.player2.deck.cards.length} cards remaining, the last three cards, top first are #{turn.player2.deck.cards[0].value}"

    if turn.player1.has_lost?
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
      break
    elsif turn.player1.has_lost? 
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
      break
    end
  end
     
  end
end



