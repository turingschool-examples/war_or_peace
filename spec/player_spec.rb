require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it 'is a player' do
        player1 = Player.new('Clarisa')

        expect(player1).to be_a(Player)
    end 

    it 'has a deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
   
        expect(player.name).to eq('Clarisa')
        expect(player.deck).to eq(deck)
    end

    it 'has not lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it 'has lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        player = Player.new('Clarisa', deck)
        deck.remove_card
        deck.remove_card
        deck.remove_card

        expect(player.has_lost?).to eq(true)
    end
end 


