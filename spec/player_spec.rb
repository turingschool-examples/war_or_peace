require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    context 'Test Set 1' do
        it 'is a player' do
            card1 = Card.new(:diamonds, 'Queen', 12)
            card2 = Card.new(:spades, 'Three', 3)
            card3 = Card.new(:hearts, 'Ace', 14) 

            clarisa_deck = Deck.new([card1, card2, card3])
            clarisa = Player.new('Clarisa', clarisa_deck)

            expect(clarisa.name).to eq('Clarisa')
            expect(clarisa.deck).to be(clarisa_deck)
            expect(clarisa.has_lost?).to eq(false)
        end
    end
end