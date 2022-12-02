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
    i = 1
    100_000_000.times do
     i += 1
     if turn.type == :basic
      p "#{turn.winner.name} won #{turn.pile_cards.length} cards"
      turn.pile_cards
      turn.award_spoils(turn.winner)
     elsif turn.type == :war 
      p "WAR - #{turn.winner.name} won #{turn.pile_cards.length} cards"
      turn.pile_cards
      turn.award_spoils(turn.winner)
     else
      p "*mutually assured desctruction* #{turn.pile_cards.length} removed from play."
      turn.pile_cards
     end
   
    p turn.player1.deck.cards.length 
    p turn.player2.deck.cards.length

    if turn.player1.deck.cards == []
      game_winner = turn.player2.name
      p '*~*~*~* #{game_winner} has won the game! *~*~*~*'
      break
    elsif turn.player2.deck.cards == []
      game_winner= turn.player1.name
      p '*~*~*~* #{game_winner} has won the game! *~*~*~*'
      break
    end
  end

    puts "*~*~*~* Aren't you bored of playing war? No one won the game! *~*~*~*"
     
  end
end



