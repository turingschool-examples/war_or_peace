require './lib/card_generator'
require './lib/deck'
require './lib/player'
require './lib/turn'

def split_deck
  cards = CardGenerator.new
  shuffled_deck = cards.create_standard_deck.shuffle
  @deck1 = Deck.new(shuffled_deck[0..25])
  @deck2 = Deck.new(shuffled_deck[26..52])

  # Test to make sure a card does not belong twice
  # deck1.cards.any? do |card|
  #   p deck2.cards.include? card
  # end
  #
  # deck2.cards.any? do |card|
  #   p deck1.cards.include? card
  # end
end

def create_two_players
  split_deck
  @player1 = Player.new("Angel", @deck1)
  @player2 = Player.new("Chris", @deck2)
end

def start
  create_two_players
end

start
