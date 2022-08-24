class Game
  attr_accessor :turn, :turn_type, :hand_winner

  def initialize(turn)
    @turn = turn
    @turn_type = @turn.type
    @hand_winner = @turn.winner
  end

  def start(player1, player2)
    puts ''
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Press 'RETURN' to start the game"
    puts '------------------------------------------------------------------'
    gets
    puts ''
    puts 'here we go!'
    puts ''
    puts ''
  end
  
  def game_over
    @turn.player1.has_lost? || @turn.player2.has_lost?
  end
  
  def endgame?
    if turn.player1.deck.cards.length < 3 || turn.player2.deck.cards.length < 3
      true
    else
      false
    end
  end
  
  def three_card_endgame?
    false
  end
  
end
