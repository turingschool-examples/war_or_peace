require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    describe '#initialize' do
        it 'requires cards and decks' do
            card1 = Card.new(:diamond, 'Queen', 12)
            expect(card1).to be_a(Card)
            card2 = Card.new(:spade, '3', 3)
            expect(card2).to be_a(Card)
            card3 = Card.new(:heart, 'Ace', 14)
            expect(card3).to be_a(Card)
            deck = Deck.new([card1, card2, card3])
            expect(deck).to be_a(Deck) 
        end

        it 'is an instance of the Player class' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player).to be_a(Player)
        end

        it 'has a name' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.name).to eq("Clarisa")
        end

        it 'has a deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.deck).to be_a(Deck)
        end
    end

    describe '#has_lost?' do
        it 'determines the player did not lose' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.has_lost?).to be false
        end

        it 'determines the player has lost' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)

            
            expect(player.deck.remove_card).to eq(card1)

            player.has_lost?
            expect(player.has_lost?).to be false
            
            expect(player.deck.remove_card).to eq(card2)

            player.has_lost?
            expect(player.has_lost?).to be false

            expect(player.deck.remove_card).to eq(card3)

            player.has_lost?
            expect(player.has_lost?).to be true
        end
    end 
end