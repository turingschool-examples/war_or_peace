require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'



def dashes
  5.times { print "-" }
  puts
end
dashes
p "Welcome to War! (or Peace) This game will be played with 52 cards."
dashes


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
player_1_deck = deck1 << shuffled.slice!(0..25)
player_2_deck = deck2 << shuffled.slice!(0..25)
players = Turn.new(@player1, @player2)
player_1 = Player.new("Dymtri", player_1_deck)
player_2 = Player.new("Lana", player_2_deck)
loop do
  start = gets.chomp
  if start == "GO"
    Game.new(players)
    break
  else
    p "Type 'GO' to start the game!"
  end
end
