require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    before(:each) do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14) 

        cards = [card1, card2, card3]

        @deck = Deck.new(cards)

        @player = Player.new("Clarisa", @deck)
    end

    it 'exists' do
        expect(@player).to be_a(Player)
    end

    it 'has readible attributes' do
        expect(@player.name).to eq("Clarisa")
        expect(@player.deck).to eq(@deck)
    end

    it 'can check if player lost' do
        expect(@player.has_lost?).to eq(false)
    end

    it 'can remove card' do
        expected_card = @player.deck.cards[0]

        expect(@player.deck.remove_card).to eq(expected_card)
    end
end