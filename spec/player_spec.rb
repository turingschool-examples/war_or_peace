require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    context 'Test Set 1' do
        it 'is a player' do
            card1 = Card.new(:diamonds, 'Queen', 12)
            card2 = Card.new(:spades, 'Three', 3)
            card3 = Card.new(:hearts, 'Ace', 14) 

            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)

            expect(player.name).to eq('Clarisa')
            expect(player.deck).to be(deck)
        end

        it 'can lose' do
            card1 = Card.new(:diamonds, 'Queen', 12)
            card2 = Card.new(:spades, 'Three', 3)
            card3 = Card.new(:hearts, 'Ace', 14)

            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)

            expect(player.deck).to be(deck)
            expect(player.has_lost?).to eq(false)
            player.deck.remove_card
            expect(player.has_lost?).to eq(false)
            player.deck.remove_card
            expect(player.has_lost?).to eq(false)
            player.deck.remove_card
            expect(player.has_lost?).to eq(true)
        end
    end
end