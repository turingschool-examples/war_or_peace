require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

def deal_cards
  deck = []
  suits = [:heart, :diamond, :spade, :club]
  ranks = (2..14).to_a

  rank_value_pairs = {}
  ranks.each do |rank|
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
  end

  suits.each do |suit|
      rank_value_pairs.each do |rank, value|
      deck << Card.new(suit, value, rank)
    end
  end
  shuffled_cards = deck.shuffle
  deck1 = Deck.new(shuffled_cards.slice(0, 26))
  deck2 = Deck.new(shuffled_cards.slice(26, 26))

  @player1 = Player.new("Honey Pie", deck1)
  @player2 = Player.new("Sgt Pepper", deck2)
end

deal_cards
game = Game.new
game.start(@player1, @player2)
