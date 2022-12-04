require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    describe 'initialize' do
        before(:each) do
            @card1 = Card.new(:diamond, 'Queen', 12)
            @card2 = Card.new(:spade, '3', 3)
            @card3 = Card.new(:heart, 'Ace', 14)
            @deck = Deck.new([@card1, @card2, @card3])
            @player = Player.new('Clarisa', @deck)
        end
        it 'exists and has a name' do
            expect(@player).to be_a(Player)
            expect(@player.name).to eq('Clarisa')
            
        end

        it 'holds a deck' do
            expect(@player.deck).to eq(@deck)
        end

        it '#has_lost? to be default false' do
            expect(@player.has_lost?).to be false
        end

        it 'loses if player has no more cards in deck' do
            expect(@player.has_lost?).to be false
            @player.deck.remove_card
            expect(@player.has_lost?).to be false
            @player.deck.remove_card
            expect(@player.has_lost?).to be false
            @player.deck.remove_card
            expect(@player.has_lost?).to be true

        end
    end
end