require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

random_cards = make_deck
random_cards1 = random_cards[0..25]
random_cards2 = random_cards[26..51]
deck1 = Deck.new(random_cards2)
deck2 = Deck.new(random_cards1)
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
turn = Turn.new(player1, player2)
new_game = Game.new(turn)

p new_game.turn.player1.deck.cards.length

new_game.start_message
