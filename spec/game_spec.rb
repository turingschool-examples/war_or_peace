require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
    it 'exists' do
            card1 = Card.new(:heart, '2', 2)
            card2 = Card.new(:heart, '3', 3)
            card3 = Card.new(:heart, '4', 4)
            card4 = Card.new(:heart, '5', 5)
            card5 = Card.new(:heart, '6', 6)
            card6 = Card.new(:heart, '7', 7)
            card7 = Card.new(:heart, '8', 8)
            card8 = Card.new(:heart, '9', 9)
            card9 = Card.new(:heart, '10', 10)
    
            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])
    
            player1 = Player.new("Megan", deck1) 
            player2 = Player.new("Aurora", deck2)  
    
            turn = Turn.new(player1, player2)
            game = Game.new
            expect(game).to be_an_instance_of(Game)
        end
end