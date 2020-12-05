require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require './lib/game'
require 'pry'

#deck set up
standard_deck = []
suits = [:club, :diamond, :heart, :spade]

suits.map do |suit|
  (2..14).each do |card|
    if card > 1 && card < 11
      standard_deck << Card.new(suit, "#{card}", card)
    elsif card == 11
      standard_deck << Card.new(suit, 'Jack', card)
    elsif card == 12
      standard_deck << Card.new(suit, 'Queen', card)
    elsif card == 13
      standard_deck << Card.new(suit, 'King', card)
    elsif card == 14
      standard_deck << Card.new(suit, 'Ace', card)
    end
  end
end

shuffle_deck = standard_deck.shuffle
deck1 = []
deck2 = []
shuffle_deck.each_with_index do |card, index|
  if index < 26
    deck1 << card
  else
    deck2 << card
  end
end

# game set up
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card3, card4, card6, card7])
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
#
# turn = Turn.new(player1, player2)
# game = Game.new(turn)
#
# # game = Game.new(turns)
# p game.welcome
#
# gets chomp
