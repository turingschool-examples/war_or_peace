require './lib/card'
require './lib/deck'
require './lib/player'
require 'rspec'

RSpec.describe Player do
    describe 'player should exist as a Player' do
        it 'The var player should be an instance of Player with args name and deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)
            expect(player).to be_a(Player)
        end

        it 'player.name should be Clarisa' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)
            expect(player.name).to eq('Clarisa')
        end

        it 'player.deck should be a deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)
            expect(player.deck).to eq(deck)
        end

        it 'player_has_lost?' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14) 
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            player = Player.new('Clarisa', deck)            
            expect(player.has_lost?).to eq(false)
            expect(player.deck.remove_card).to eq(card1)
            expect(player.has_lost?).to eq(false)
            expect(player.deck.remove_card).to eq(card2)
            expect(player.has_lost?).to eq(false)
            expect(player.deck.remove_card).to eq(card3)
            expect(player.has_lost?).to eq(true)
            expect(player.deck.cards).to eq([])
        end
    end
end
            


