class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts "      Welcome to War! (or Peace) This game will be played
      with 52 cards.
      The players today are #{@player1.name} and #{@player2.name}.
      Type 'GO' to start the game!
      ________________________________________________________"
  end

  def play
    count = 1
    while count < 15
      turn = Turn.new(@player1, @player2)
      winner = turn.winner

      if turn.type == :mutually_assured_destruction
        p "Turn #{count}: *mutually assured destruction*
          3 cards from each of your decks making their way to el garbagio."
        turn.pile_cards
      elsif turn.type == :war
        p "Turn #{count}: #{turn.winner.name} cleaning house and snatchin' 6 cards."
        turn.pile_cards
        turn.award_spoils(winner)
      else turn.type == :basic
        p "Turn #{count}: #{turn.winner.name} inchin' towards the win and claiming 2 cards."
        turn.pile_cards
        turn.award_spoils(winner)
      end
      count += 1
    end
  end
end
