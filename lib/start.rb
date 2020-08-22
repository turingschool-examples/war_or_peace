class Start
  attr_reader :turn
  def initialize(turn)
    @turn = turn
  end

  def start
    while @deck != []
      @turn(@player1, @player2)

  end
end
