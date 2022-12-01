class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    puts "Welcome to War! (or Peace).\nThis game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------"
    choice = gets.chomp.to_s
    if choice.downcase == 'go'
      output_game
    else
      start
    end
  end

    def output_game
      i = 1
      loop do
        puts "Turn #{i}: #{turn.winner.name} won #{turn.pile_cards.length} cards"
        i += 1
        turn.award_spoils(turn.winner)
        if turn.player1.deck.cards == [] || turn.player1.deck.cards == []
          break
        end
      end

      puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
     
    end

  


end



