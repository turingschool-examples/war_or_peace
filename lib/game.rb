# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'
# require './war_or_peace_runner'

class Game
  attr_reader :player1,
              :player2,
              :cards,
              :deck1,
              :deck2

  def initialize
    @deck1 = ([])
    @deck2 = ([])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def deal_cards
    @deck1 << cards.sample(26)
    @deck1.flatten!
    cards.select do |card|
      if @deck1.include?(card)
        next
      else
        @deck2 << card
      end
    @player1 << @deck1
    @player2 << @deck2
    end

  end

end
