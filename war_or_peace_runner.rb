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
cards1 = []
cards2 = []
shuffle_deck.each_with_index do |card, index|
  if index < 26
    cards1 << card
  else
    cards2 << card
  end
end

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

#Player set up
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
#Game set up
turns = Turn.new(player1, player2)

game = Game.new(turns)
#GAME PLAY WITH TURN CLASS ONLY

# game.start

until game.turns.player1.deck.cards.empty? || game.turns.player2.deck.cards.empty?
  winner = turns.winner
      p turns.type
      p turns.pile_cards
      p turns.award_spoils(winner)
      turns = Turn.new(player1, player2)
    end



#   if game.turns.player1.deck.cards  == [] && turn.player2.deck.cards == []
#     p "This is mathmatically near impossible, you have accomplished something rare! It is impressive, but everyone LOSES."
#   elsif game.turns.player1.deck.cards  == []
#     p "*~*~*~* Aurora has won the game! *~*~*~*"
#   elsif game.turns.player2.deck.cards == []
#     p "*~*~*~* Megan has won the game! *~*~*~*"
#   elsif
#     p winner = turn.winner
#     p turn.type
#     p turn.pile_cards
#     p turn.award_spoils(winner)
#     p player1.deck.cards.length
#     p player2.deck.cards.length
#     turn = Turn.new(player1, player2)
#   end






























# game.each do |turn|
#   turn.turn.winner = winner
#   turn.turn.pile_cards
#   turn.turn.award_spoils
# end
