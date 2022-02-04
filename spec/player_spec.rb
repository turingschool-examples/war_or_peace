require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'




RSpec.describe Player do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it 'gets the name attribute' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player.name).to eq('Clarisa')
  end




end
