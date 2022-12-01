require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    
    it 'can initialize new player' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)


        expect(player.name).to eq("Clarisa")
        expect(player.deck).to eq(deck)
    end

    it 'can store player loss status' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
    
# require 'pry'; binding.pry
        expect(player.has_lost?).to be false

        player.deck.remove_card

        expect(player.has_lost?).to be false

        player.deck.remove_card

        expect(player.has_lost?).to be false

        player.deck.remove_card

        expect(player.has_lost?).to be true
    end

end