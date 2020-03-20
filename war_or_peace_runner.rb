require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
#require './lib/game'
require 'pry'

# create 52 cards (i.e. standard deck)

# 4 suits = symbol
  # 2 - 10 number cards(9), jack, king, queen, ace = string
    # 13 ranks per suit = int

def full_deck
  deck = []
  suits = [:heart, :diamond, :spade, :club]
  ranks = (2..13).to_a
  values = (2..10).to_s, "Jack", "Queen", "King", "Ace"
  ranks.each do |rank|
    suits.each do |suit|
      values.each do |value|
      deck << Card.new(suit, value, rank)
      end
    end
  end
  deck
end

p full_deck


  # value = #numers 2 - 10.to_s + "Queen", "King", "Jack", "Ace"

# split those cards into two deck, randomly
#
# create two players with the deck created above
#
# START the game using a new method called START (put it into a class or create a new class)
#
# if input = GO the game starts and then prints to the console different turns until game is completed or no one wins.
