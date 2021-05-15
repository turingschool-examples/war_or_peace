class Game
  attr_reader :player1,
              :player2,
              :full_deck

  def initialize(player1, player2, full_deck)
    @player1 = player1
    @player2 = player2
    @full_deck = full_deck
  end
end
