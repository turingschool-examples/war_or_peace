class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @count = 0
  end

  def start
    puts "      - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      - Welcome to the War (or Peace) Arena...
      - Where 52 cards and 2 players equals (almost) infinite possibilities.
      - The battle between #{@player1.name} and #{@player2.name}
      - will commence as soon as you type 'GO'!
      - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
  end

  def play
    while @count <= 1000000
      @count += 1
      turn = Turn.new(@player1, @player2)

      if turn.type == :mutually_assured_destruction
        message = ['Negative 3 cards for the both of you.',
          "Taking 3 cards from #{@player1.name} and 3 cards from #{@player2.name} and tossing them into el garbagio."]
        p "Turn #{@count}: *MUTUALLY ASSURED DESTRUCTION* #{message.sample}"
        winner = turn.winner
        turn.pile_cards
      elsif turn.type == :war
        p "Turn #{@count}: #{turn.winner.name} wins this --*WAR*-- and sweeps up 6 cards."
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
      else turn.type == :basic
        message = ['adds 2 to the ImGonnaWin pile.', 'taking 2 cards and heading towards Winsville.',
        'slipping 2 cards into an envelope, slapping a stamp on it and mailing out to Winnerton Town.',
        'getting closer to WinnerRamaTownsVilleTon with 2 more cards.', 'sitting pretty with 2 more cards.',
        'takes 2 cards and adds them to the pile of awesome.']
        p "Turn #{@count}: #{turn.winner.name} #{message.sample}"
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
      end

      if @player1.has_lost? && !@player2.has_lost?
          p "#{@player2.name} has won the game!"
          break
      elsif @player2.has_lost? && !@player1.has_lost?
          p "#{@player1.name} has won the game!"
          break
      else
        if @count == 1000000
          p "- DRAW - - - NOBODY WINS - - - DRAW -"
          break
        end
      end
    end
  end
end
