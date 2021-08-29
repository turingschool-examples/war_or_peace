
class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1  = player1
    @player2  = player2
  end

  def start
    puts welcome
    puts user_input
  end


  def start_game
    p "Hello!"
    turn_count = 0
    turn = Turn.new(player1, player2)
    while turn_count < 1000000
      if (player1.has_lost? == true) || (player2.has_lost? == true)
        break
      else
        turn_count += 1
        p "Turn #{turn_count}"
        turn.pile_cards
        p player1.deck.cards[0].rank
        p player2.deck.cards[0].rank
        winner = turn.winner
        turn.award_spoils(winner)
        p "The winner is #{turn.winner.name}"
        p "#{player1.name} has #{player1.deck.cards.count} cards left"
        p "#{player2.name} has #{player2.deck.cards.count} cards left"
        # if player1.has_lost? == true
        #   p "#{player2.name} has won"
        #   break
        # end
        # if player2.has_lost? == true
        #   p "#{player1.name} has won"
        #   break
        # end
        print "\n"
      end
    end
  end

  def user_input
    input = gets.chomp
    if input.upcase == "GO"
      start_game
    elsif input.upcase != "GO"
      puts "Maybe next time"
      exit
    end
  end

  def welcome
    "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
  end
end
