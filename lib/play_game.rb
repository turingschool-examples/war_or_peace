require './card'
require './deck'
require './player'
require './turn'

class Play_game
  attr_reader :player1,
              :player2

  def initialize
    @deck1 = ([])
    @deck2 = ([])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def deal_cards
    @deck1 << cards.shuffle!.shift
    @deck2 << cards
  end
end
