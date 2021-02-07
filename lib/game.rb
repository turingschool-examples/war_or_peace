class Game

  attr_reader :player1,
  :player2,
  :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = turn_count
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with #{@player1.deck.cards.size + @player2.deck.cards.size} cards ."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "-" * 45

    turn_count = 0
    #user has to type GO
    user_input = gets.chomp.upcase


    if user_input == "GO"
      puts  "Let's start the game"
      until @player1.has_lost? || @player2.has_lost? || turn_count == 1000000 do
        # if turn_count == 0
        #   @player1.deck.cards.shuffle!
        #   @player2.deck.cards.shuffle!
        # end

        turn = Turn.new(@player1,@player2)

        type = turn.type
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turn_count += 1


        if type == :mutually_assured_destruction
          puts "#{turn_count}: *mutually assured destruction* 6 cards removed from play"
        elsif type == :war
        #     # we remove all 3 cards from both decks and add all these cards to @spoils_of_war and the winner of that turn gets
            puts "Turn #{turn_count}: dis is WAR - #{winner.name} won 6 cards"
        else type == :basic
              puts "Turn #{turn_count}: #{winner.name} won 2 cards"
        end


      end

      if @player1.has_lost?
        p "#{@player2.name} has won the game!"

      elsif @player2.has_lost?
       p "#{@player1.name} has won the game!"

     elsif (!@player1.has_lost? && !@player2.has_lost?) && turn_count == 1000000
        p "------DRAW--------"

      else
      end

          # every time we make a turn we << into turn.count
        else user_input != "GO"
          puts "Hmmm... maybe next time. BAI"
        end
      end
    end
