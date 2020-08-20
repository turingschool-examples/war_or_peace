class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"

    #accepts go or GO to start game, and loops until that word is received
    until gets.chomp.upcase == "GO" do
      puts "Sorry, really need you to type that word 'go' to move forward..."
    end

    #game will be limited to 1,000,000 turns. initializing counter.
    turn_count = 0

    #take turns until someone has lost or turn_count is 1,000,000
    until @player1.has_lost? || @player2.has_lost? || turn_count == 1000000 do
      turn_count += 1
      turn = Turn.new(player1,player2)

      print "Turn #{turn_count}: " #print turn number

      print " - Alex Deck: #{turn.player1.deck.cards.size}, Ghengis Deck: #{turn.player2.deck.cards.size} ---"


      #determine who is winner of this hand before removing cards from decks
      hand_winner = turn.winner

      #print the outcome of the turn (need to print outcome before removing cards from deck because turn.type determined by current deck)
      if turn.type == :war
        print "WAR - #{hand_winner.name} won 6 cards\n"
      elsif turn.type == :mutually_assured_destruction
        print "*mutually assured destruction* 6 cards removed from play\n"
      else
        print "#{hand_winner.name} won 2 cards\n"
      end

      #remove cards from deck based on turn type
      turn.pile_cards

      #give cards to winner of hand
      turn.award_spoils(hand_winner)


    end #end until loop

    if turn_count == 1000000
      print "---- DRAW ----"
    else
      print "*-*-*-* #{hand_winner.name} has won the game! *-*-*-*"
    end

  end
end
