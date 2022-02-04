class Game
    attr_reader :player1, :player2, :built_deck, :turn_count
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @turn_count = 1
      @built_deck = []
    end
end