require './lib/turn'
require './lib/game_deck'

deck = GameDeck.new
deck.build_game_deck
deck1 = Deck.new(deck.game_deck)
deck2 = Deck.new(deck.game_deck)
deck1.shuffle
deck2.shuffle
player1 = Player.new('Lee', deck1)
player2 = Player.new('Natalie', deck2)
turn = Turn.new(player1, player2)
turn.start
