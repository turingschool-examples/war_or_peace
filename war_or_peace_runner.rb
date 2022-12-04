require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

CARD_MAP = {
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  10 => "10",
  11 => "Jack",
  12 => "Queen",
  13 => "King",
  14 => "Ace"
}
starting_deck = [:diamond, :heart, :spade, :club].flat_map do |suit|
  (2..14).to_a.map do |rank|
      value = CARD_MAP[rank]
      card = Card.new(suit, value, rank)
  end
end

shuffled_deck = starting_deck.shuffle!

  deck1 = shuffled_deck.first(26)
  deck2 = shuffled_deck.last(26)

  player1 = Player.new("Megan", Deck.new(deck1))
  player2 = Player.new("Aurora", Deck.new(deck2))
  game = Game.new(player1, player2)
  puts game.welcome_to_war
game.start_game(gets.chomp)
