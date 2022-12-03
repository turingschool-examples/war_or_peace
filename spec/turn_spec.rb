require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
    context 'Test Set 1' do
        it 'facilitates a turn' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)

            expect(turn).to be_an_instance_of(Turn)
        end

    end
end