require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    before(:each) do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14)
        @deck = Deck.new([@card1, @card2, @card3])
        @player = Player.new('Clarisa', @deck) 
    end   
    describe '#initialize' do
        it 'requires cards and decks' do
            expect(@card1).to be_a(Card)
            expect(@card2).to be_a(Card)
            expect(@card3).to be_a(Card)
            expect(@deck).to be_a(Deck) 
        end

        it 'is an instance of the Player class' do
            expect(@player).to be_a(Player)
        end

        it 'has a name' do
            expect(@player.name).to eq("Clarisa")
        end

        it 'has a deck' do
            expect(@player.deck).to be_a(Deck)
        end
    end

    describe '#has_lost?' do
        it 'determines the player did not lose' do
            expect(@player.has_lost?).to be false
        end

        it 'determines the player has lost' do
            expect(@player.deck.remove_card).to eq(@card1)
            expect(@player.has_lost?).to be false
            expect(@player.deck.remove_card).to eq(@card2)
            expect(@player.has_lost?).to be false
            expect(@player.deck.remove_card).to eq(@card3)
            expect(@player.has_lost?).to be true
            expect(@player.deck).to eq(@deck)
        end
    end  
end