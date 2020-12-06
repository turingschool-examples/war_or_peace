require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'
require_relative 'game'

# method to convert rank integers to value strings
# for passing to Card constructor
def normalize_value(rank)
  face_values = ['Jack', 'Queen', 'King']
  if rank == 1
    'Ace'
  elsif rank < 11
    rank.to_s
  else
    face_values[rank - 11]
  end
end

# build a standard deck
game_deck = []
suits = [:diamond, :heart, :spade, :club]
ranks = [1,2,3,4,5,6,7,8,9,10,11,12,13]
suits.each do |suit|
  ranks.each do |rank|
    card = Card.new(suit, normalize_value(rank), rank)
    game_deck << card
  end
end

# shuffle full deck, then distribute to player decks
shuffled_deck = game_deck.shuffle
deck1 = shuffled_deck[0..25]
deck2 = shuffled_deck[26..51]

# initialize game state
player1 = Player.new('April', deck1)
player2 = Player.new('July', deck2)


game = Game.new(player1, player2)
game.start
