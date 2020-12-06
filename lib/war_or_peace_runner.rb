require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'

full_deck = []
deck1 = []
deck2 = []
suits = %i[heart club diamond spade]
 ranks = {"2" => 2,
             "3" => 3,
             "4" => 4,
             "5" => 5,
             "6" => 6,
             "7" => 7,
             "8" => 8,
             "9" => 9,
            "10" => 10,
          "jack" => 11,
         "queen" => 12,
          "king" => 13,
           "ace" => 14}

deck = suits.flat_map do |suit|
        ranks.map do |rank, i|
          Card.new(suit, rank, i)
        end
      end
deck

shuffled = deck.shuffle
player_1_deck = deck1 << shuffled.slice!(0..25)
player_2_deck = deck2 << shuffled.slice!(0..25)

player_1 = Player.new("Dmytri", player_1_deck)
player_2 = Player.new("Lana", player_2_deck)

class Game
  attr_reader :start
  def initialize(player_1, player_2)
    @start = start
  end
end

start_game = Game.new(player_1, player_2)

go = $stdin.gets.chomp.upcase

if go == "Go"
  start_game.start
else
  p "Type Go to start!"
end
