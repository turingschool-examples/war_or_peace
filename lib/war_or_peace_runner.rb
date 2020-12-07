require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'Jack', 'Queen', 'King', 'Ace']
cards = []

suits.each do |suit|
  count = 1
  values.each do |value|
    cards << Card.new(suit, value, count)
    count += 1
  end
end

g = CardGenerator.new('test.txt')
g.set_cards

deck1 = Deck.new(g.cards[0..25].shuffle)
deck2 = Deck.new(g.cards[26..51].shuffle)
player1 = Player.new("Aurora", deck1)
player2 = Player.new("Josh", deck2)
turn = Turn.new(player1, player2)
game = Game.new(turn)
game.start
