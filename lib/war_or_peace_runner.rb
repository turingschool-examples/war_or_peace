require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

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

@deck = suits.flat_map do |suit|
        ranks.map do |rank, i|
          Card.new(suit, rank, i)
        end
      end
@deck

shuffled = @deck.shuffle
deck1 = shuffled[0..25]
deck2 = shuffled[26..51]
player_1_deck = Deck.new(deck1)
player_2_deck = Deck.new(deck2)
@player1 = Player.new("Dymtri", player_1_deck)
@player2 = Player.new("Lana", player_2_deck)
players = Turn.new(@player1, @player2)

start_game = Game.new(players)
require "pry"; binding.pry
# start_game.intro
