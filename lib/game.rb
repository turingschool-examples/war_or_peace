class Game
  attr_reader :player1,
              :player2,

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    # game = Game.new
    p "Welcome to War! (or Peace) This game will be played with 52 cards.", "The players today are Megan and Aurora.", "Type 'GO' to start the game!", "------------------------------------------------------------------"
    response = gets.chomp.upcase
    if response == "GO"
      game.play
    end
  end

  def player_turn
   turn = Turn.new(player1, player2)

   if turn.type == :basic
     winner = turn.winner

  # turn.spoils_of_war
  # turn.type
  # winner = turn.winner
  # turn.pile_cards
  end

  #
  # turn.spoils_of_war
  # turn.award_spoils(winner)
  #
  # player1.deck
  # player2.deck
end
end 
