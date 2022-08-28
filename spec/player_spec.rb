require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

RSpec.describe Player do
    it 'exists' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    expect(player.name).to eq 'Clarisa'
    expect(player.deck).to eq deck 
    end
    
    it 'can check if a player has lost' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    expect(player.has_lost?).to eq false
    end

    it 'can remove cards and check better if a player has lost' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.has_lost?
    player.deck.remove_card
    player.has_lost?
    player.deck.remove_card
    expect(player.has_lost?).to eq true
    expect(player.deck.cards.length).to eq 0
    end


end
