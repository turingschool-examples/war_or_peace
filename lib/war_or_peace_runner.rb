require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_creator'
require './lib/play_game'

@card_creator = CardCreator.new()
@card_creator.create_deck

@shuffled_cards = @card_creator.full_deck.shuffle!

@deck1 = Deck.new(@shuffled_cards.slice(1..26))
@deck2 = Deck.new(@shuffled_cards.slice(27..52))


@player1 = Player.new('Megan', @deck1)
@player2 = Player.new('Aurora', @deck2)


game = PlayGame.new(@player1, @player2)
game.start
