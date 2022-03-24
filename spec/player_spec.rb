require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

describe Player do
    describe '#initialize' do
      it 'is a Player' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        player = Player.new('Zach', deck)
        expect(player).to be_a Player
      end
    end

    describe '#name' do
        it 'has a name' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        player = Player.new('Zach', deck)
        expect(player.name).to eq 'Zach'
        end
    end

    describe '#has_lost?' do
        it 'player has lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        player = Player.new('Zach', deck)
        deck.remove_card
        deck.remove_card
        deck.remove_card
        expect(player.has_lost?).to eq true
        end
    end

end