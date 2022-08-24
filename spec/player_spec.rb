require 'rspec'
require './lib/player'

RSpec.describe Player do 
    describe '#initialize' do 
        it 'exists and has attributes' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)

            expect(player).to be_an_instance_of(Player)
            expect(player.name).to eq('Clarisa')
            expect(player.deck).to eq(deck)
            expect(player.has_lost?).to eq(false)
        end 
    end 
    describe '#has_lost?' do 
        it 'has lost when no more cards left in deck' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)

            expect(player.deck).to eq(deck)
            expect(player.has_lost?).to eq(false)

            player.deck.remove_card
            expect(player.has_lost?).to eq(false)
            player.deck.remove_card
            expect(player.has_lost?).to eq(false)
            player.deck.remove_card
            expect(player.has_lost?).to eq(true)
            expect(player.deck.cards).to eq([])
        end 
    end
end
