require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it 'is an instance of a player' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        player1 = Player.new('Clarisa', deck)
        expect(player1).to be_a(Player)
    end

    it 'is has a name and a deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        player1 = Player.new('Clarisa', deck)
        expect(player1.name).to eq('Clarisa')
        expect(player1.deck).to eq(deck)
    end

    it 'can remove card from a players deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        player1 = Player.new('Clarisa', deck)
        expect(player1.deck.remove_card).to eq(card1)
    end

    it 'can tell if a player has lost' do 
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new()
        deck.add_card(card1)
        deck.add_card(card2)
        deck.add_card(card3)
        player1 = Player.new('Clarisa', deck)
        expect(player1.has_lost?).to eq(false)
        player1.deck.remove_card
        expect(player1.has_lost?).to eq(false)
        player1.deck.remove_card
        expect(player1.has_lost?).to eq(false)
        player1.deck.remove_card
        expect(player1.has_lost?).to eq(true)
        expect(player1.deck.cards.count).to eq(0)
    end

end