require './lib/card'
require './lib/deck'
require './lib/player'
require 'rspec'

RSpec.describe Player do
    describe 'initialize' do
        it 'is an instance of player' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)

            expect(player).to be_a(Player)
        end

        it 'player has #name' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)

            expect(player.name).to eq('Clarisa')
        end

        it 'player has a #deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)

            expect(player.deck).to be_a(Deck)
        end
    

        it 'player has lost' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)

            expect(player.has_lost?).to be false
        end
    end
end