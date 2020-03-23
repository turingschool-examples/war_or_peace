require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


deck = []
suits = [:heart, :diamond, :spade, :club]
ranks = (2..14).to_a

rank_value_pairs = {}
ranks.each  {|rank|
  key = rank
  value = rank.to_s
    if value == "11"
      value = "Jack"
    elsif value == "12"
      value = "Queen"
    elsif value == "13"
      value = "King"
    elsif value == "14"
      value = "Ace"
    end
  rank_value_pairs[key] = value
}

suits.each {|suit|
    rank_value_pairs.each do |rank, value|
    deck << Card.new(suit, value, rank)
  end}

  shuffled_cards = deck.shuffle
  deck1 = Deck.new(shuffled_cards.slice(0, 26))
  deck2 = Deck.new(shuffled_cards.slice(27, 52))

  player1 = Player.new('Huxley', deck1)
  player2 = Player.new('Petra', deck2)

  game = Game.new(player1, player2)
  game.start

class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end


end
