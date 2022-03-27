class Game
  attr_reader :player1,
              :player2,
              :turn_count
  def initialize(p1_name, p2_name)
    @player1 = Player.new(p1_name, @deck1)
    @player2 = Player.new(p2_name, @deck2)
    turn_count = 0
  end
end
